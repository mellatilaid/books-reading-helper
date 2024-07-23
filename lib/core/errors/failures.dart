abstract class Failures {
  String errMessage;

  Failures(this.errMessage);
}

class GetStorageFilesFailure extends Failures {
  GetStorageFilesFailure(super.errMessage);
}
