import 'package:books_reading_helper/core/enums/device_adroid_sdk_version.dart';
import 'package:books_reading_helper/core/functions/reqeust_permission.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/services.dart';

Future<String?> baseDirectory() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    if (androidDeviceInfo.version.sdkInt < 30) {
      final bool isGranted = await permissionRequest(
          androidSdkVersion: AndroidSdkVersion.bellow30);
      if (isGranted) {
        var rootDirectory = await ExternalPath.getExternalStorageDirectories();
        return rootDirectory.first;
      }
    } else {
      final bool isGranted = await permissionRequest(
          androidSdkVersion: AndroidSdkVersion.aboove30);
      if (isGranted) {
        var rootDirectory = await ExternalPath.getExternalStorageDirectories();
        return rootDirectory.first;
      }
    }
    return null;
  } on PlatformException catch (e) {
    throw PlatformException(code: e.code, message: e.message);
  }
}
