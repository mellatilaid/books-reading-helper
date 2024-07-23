import 'dart:io';

import 'package:books_reading_helper/core/errors/Failures.dart';
import 'package:books_reading_helper/core/functions/scan_directory.dart';
import 'package:books_reading_helper/features/home/data/repos/home_repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failures, List<File>>> getUserDownloadedPdfs() async {
    List<File> pdfFiles = [];
    Directory? dir = await getExternalStorageDirectory();

    if (dir != null) {
      await scanDirectory(dir, pdfFiles);
    } else {
      return left(GetStorageFilesFailure('Storage anvailable'));
    }
    if (pdfFiles.isEmpty) {
      return left(GetStorageFilesFailure('No pdf files found'));
    }
    return right(pdfFiles);
  }
}
