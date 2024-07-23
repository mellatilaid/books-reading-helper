import 'dart:io';

Future<void> scanDirectory(Directory directory, List<File> pdfFiles) async {
  List<FileSystemEntity> entities = await directory.list().toList();
  for (var entity in entities) {
    if (entity is Directory) {
      await scanDirectory(entity, pdfFiles);
    } else if (entity is File && entity.path.endsWith('.pdf')) {
      pdfFiles.add(entity);
    }
  }
}
