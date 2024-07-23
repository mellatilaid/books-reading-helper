import 'package:books_reading_helper/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        SizedBox(
          height: 16,
        ),
        ListTile(
          leading: Icon(Icons.picture_as_pdf),
          title: Text('Clean Code'),
        )
      ],
    );
  }
}
