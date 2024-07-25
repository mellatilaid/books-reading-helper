import 'dart:io';

import 'package:books_reading_helper/features/home/presentation/manager/fetchdownloadedfiles/fetch_downloaded_files_cubit.dart';
import 'package:books_reading_helper/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:books_reading_helper/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:books_reading_helper/features/home/presentation/views/widgets/user_local_books_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchDownloadedFilesCubit(),
      child: const Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 16,
          ),
          Expanded(child: UserLocalBooksListViewBuilder()),
        ],
      ),
    );
  }
}

class DownLoadedFilesListView extends StatelessWidget {
  final List<File> pdfFiles;
  const DownLoadedFilesListView({super.key, required this.pdfFiles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          return CustomBookItem(bookTitle: pdfFiles[index].path);
        });
  }
}
