class PermissionException implements Exception {
  final String message;

  PermissionException(this.message);
}

class FileSystemException implements Exception {
  final String message;

  FileSystemException(this.message);
}
