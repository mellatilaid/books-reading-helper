import 'package:books_reading_helper/core/errors/exceptions.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  try {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  } on Exception catch (e) {
    throw PermissionException('storage permision not granted ${e.toString()}');
  }
}
