import 'dart:io';

import 'package:books_reading_helper/core/errors/exceptions.dart';

abstract class Failures {
  String errMessage;

  Failures(this.errMessage);
}

class StorageFilesFailure extends Failures {
  StorageFilesFailure(super.errMessage);

  factory StorageFilesFailure.fromStorage(Exception e) {
    switch (e) {
      case PermissionException():
        return StorageFilesFailure(e.toString());
      case FileScanException():
        return StorageFilesFailure(e.toString());
      case FileSystemException():
        return StorageFilesFailure(
            'File system exception occurred ${e.toString()} ');
      case IOException():
        return StorageFilesFailure('IO exception occurred ${e.toString()} ');
      default:
        return StorageFilesFailure('unexpected error accured ${e.toString()}');
    }
  }
}
