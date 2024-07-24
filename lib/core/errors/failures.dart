import 'package:books_reading_helper/core/errors/exceptions.dart';

abstract class Failures {
  String errMessage;

  Failures(this.errMessage);
}

class StorageFilesFailure extends Failures {
  StorageFilesFailure(super.errMessage);

  factory StorageFilesFailure.fromStorage(Exception e) {
    if (e is FileScanException) {
      return StorageFilesFailure(e.toString());
    } else if (e is PermissionException) {
      return StorageFilesFailure(e.toString());
    } else {
      return StorageFilesFailure('Unexpected error occurred, Please try again');
    }
  }
}
