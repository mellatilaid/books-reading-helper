import 'package:books_reading_helper/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Books Reading Helper',
            style: Styles.textStyle18,
          ),
          Icon(Icons.search),
        ],
      ),
    );
  }
}
