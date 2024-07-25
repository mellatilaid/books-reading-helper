import 'package:books_reading_helper/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/const.dart';

class UserFilesListView extends StatelessWidget {
  final List<BooksType> pdfFiles;
  const UserFilesListView({super.key, required this.pdfFiles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          return CustomBookItem(bookTitle: pdfFiles[index]);
        });
  }
}
