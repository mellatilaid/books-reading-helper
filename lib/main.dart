import 'package:books_reading_helper/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooksReadingHelper());
}

class BooksReadingHelper extends StatelessWidget {
  const BooksReadingHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
