import 'package:flutter/material.dart';

import 'features/home/presentation/views/home_view.dart';

void main() {
  runApp(const BooksReadingHelper());
}

class BooksReadingHelper extends StatelessWidget {
  const BooksReadingHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
