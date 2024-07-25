import 'package:books_reading_helper/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_data.dart';

class CustomBookItem extends StatelessWidget {
  final String bookTitle;
  const CustomBookItem({super.key, required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(AssetsData.bookItemIcon),
      title: Text(
        bookTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Styles.textStyle16,
      ),
    );
  }
}
