import 'package:books_reading_helper/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as pth;

import '../../../../../core/utils/const.dart';

class UserFilesListView extends StatelessWidget {
  final List<BooksType> pdfFiles;
  const UserFilesListView({super.key, required this.pdfFiles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pdfFiles.length,
      separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
      itemBuilder: (context, index) {
        return CustomBookItem(
          bookTitle: pth.basename(pdfFiles[index]),
        );
      },
    );
  }
}
