import 'dart:async';

import 'package:books_reading_helper/core/errors/exceptions.dart';
import 'package:permission_handler/permission_handler.dart';

import '../enums/device_adroid_sdk_version.dart';

Future<bool> permissionRequest(
    {required AndroidSdkVersion androidSdkVersion}) async {
  Completer<bool> completer = Completer<bool>();
  switch (androidSdkVersion) {
    case AndroidSdkVersion.bellow30:
      await Permission.storage.onDeniedCallback(() async {
        await Permission.storage.request();
      }).onGrantedCallback(() {
        completer.complete(true);
      }).onPermanentlyDeniedCallback(() async {
        await openAppSettings();
      }).onRestrictedCallback(() {
        throw PermissionException(
            'The permission is restricted by the operating system and cannot be requested. Please check the documentation for more information.');
      }).onLimitedCallback(() {
        throw PermissionException(
            ' The permission is granted but with limitations');
      }).onProvisionalCallback(() {
        throw PermissionException(
            'You should give us permission again to continue using our app');
      }).request();

    case AndroidSdkVersion.aboove30:
      await Permission.manageExternalStorage.onDeniedCallback(() async {
        await Permission.storage.request();
      }).onGrantedCallback(() {
        completer.complete(true);
      }).onPermanentlyDeniedCallback(() async {
        await openAppSettings();
      }).onRestrictedCallback(() {
        throw PermissionException(
            'The permission is restricted by the operating system and cannot be requested. Please check the documentation for more information.');
      }).onLimitedCallback(() {
        throw PermissionException(
            ' The permission is granted but with limitations');
      }).onProvisionalCallback(() {
        throw PermissionException(
            'You should give us permission again to continue using our app');
      }).request();
  }

  return completer.future;
}
