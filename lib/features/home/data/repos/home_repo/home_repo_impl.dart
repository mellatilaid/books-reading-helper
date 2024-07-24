import 'dart:io';

import 'package:books_reading_helper/features/home/data/repos/home_repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/functions/request_storage_permision.dart';
import '../../../../../core/functions/scan_directory.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failures, List<File>>> getUserDownloadedPdfs() async {
    List<File> pdfFiles = [];
    try {
      await requestStoragePermission();
      Directory? dir = await getDownloadsDirectory();

      if (dir != null) {
        await scanDirectory(dir, pdfFiles);
      } else {
        return left(StorageFilesFailure('Storage unvailable'));
      }
      if (pdfFiles.isEmpty) {
        return left(StorageFilesFailure('No pdf files found'));
      }
      return right(pdfFiles);
    } on Exception catch (e) {
      return left(StorageFilesFailure.fromStorage(e));
    } catch (e) {
      return left(
        StorageFilesFailure('Unexpected error occurred ${e.toString()}'),
      );
    }
  }
}
