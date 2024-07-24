class PermissionException implements Exception {
  final String message;

  PermissionException(this.message);
}

class FileScanException implements Exception {
  final String message;

  FileScanException(this.message);
}
