import 'dart:io';

import 'package:books_reading_helper/core/utils/const.dart';
import 'package:flutter/foundation.dart';

Future<void> getFiles(Directory directory, List<BooksType> pdfFiles) async {
  try {
    List<FileSystemEntity> entities = await directory.list().toList();
    for (var entity in entities) {
      if (entity is Directory) {
        await getFiles(entity, pdfFiles);
      } else if (entity is File && entity.path.endsWith('.pdf')) {
        pdfFiles.add(entity.path);
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
