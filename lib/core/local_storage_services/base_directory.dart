import 'package:device_info_plus/device_info_plus.dart';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String?> baseDirectory() async {
  /*var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  return null;*/
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    if (androidDeviceInfo.version.sdkInt < 30) {
      PermissionStatus permissionStatus = await Permission.storage.request();
      if (permissionStatus.isGranted) {
        var rootDirectory = await ExternalPath.getExternalStorageDirectories();
        return rootDirectory.first;
      }
    } else {
      PermissionStatus permissionStatus =
          await Permission.manageExternalStorage.request();
      if (permissionStatus.isGranted) {
        var rootDirectory = await ExternalPath.getExternalStorageDirectories();
        return rootDirectory.first;
      }
    }
    return null;
  } on Exception catch (e) {
    // TODO
  }
  return null;
}
