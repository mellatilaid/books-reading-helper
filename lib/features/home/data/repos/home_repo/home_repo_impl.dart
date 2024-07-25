import 'dart:io';

import 'package:books_reading_helper/core/local_storage_services/base_directory.dart';
import 'package:books_reading_helper/core/local_storage_services/get_files.dart';
import 'package:books_reading_helper/features/home/data/repos/home_repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../../../../core/errors/failures.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failures, List<File>>> getUserDownloadedPdfs() async {
    List<File> pdfFiles = [];
    try {
      final String? directoryPath = await baseDirectory();

      if (directoryPath != null) {
        Directory rootDir = Directory(directoryPath);
        await getFiles(rootDir, pdfFiles);

        return right(pdfFiles);
      } else {
        return left(StorageFilesFailure('No directory found for pdf files'));
      }
    } on PlatformException catch (e) {
      return left(StorageFilesFailure.fromStorage(e));
    } on Exception catch (e) {
      return left(StorageFilesFailure.fromStorage(e));
    } catch (e) {
      return left(
        StorageFilesFailure('Unexpected error occurred ${e.toString()}'),
      );
    }
  }
}

/*Future<void> scanDirectory(Directory directory, List<File> pdfFiles) async {
    List<FileSystemEntity> entities = await directory.list().toList();
    for (var entity in entities) {
      if (entity is Directory) {
        await scanDirectory(entity, pdfFiles);
      } else if (entity is File && entity.path.endsWith('.pdf')) {
        pdfFiles.add(entity);
      }
    }
    /*List<String> pdfFiles = [];
    try {
      final String? directoryPath = await baseDirectory();
      if (directoryPath != null) {
        await getFiles(directoryPath, pdfFiles);
        return right(pdfFiles);
      } else {
        return left(StorageFilesFailure('No directory found for pdf files'));
      }
    } on Exception catch (e) {
      return left(StorageFilesFailure.fromStorage(e));
    } catch (e) {
      return left(
        StorageFilesFailure('Unexpected error occurred ${e.toString()}'),
      );
    }
  }*/
  }*/