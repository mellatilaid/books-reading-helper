import 'package:books_reading_helper/features/home/presentation/manager/fetchdownloadedfiles/fetch_downloaded_files_cubit.dart';
import 'package:books_reading_helper/features/home/presentation/views/widgets/user_files_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLocalBooksListViewBuilder extends StatefulWidget {
  const UserLocalBooksListViewBuilder({super.key});

  @override
  State<UserLocalBooksListViewBuilder> createState() =>
      _UserLocalBooksListViewBuilderState();
}

class _UserLocalBooksListViewBuilderState
    extends State<UserLocalBooksListViewBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<FetchDownloadedFilesCubit>(context).getUserDownloadedPdfs();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDownloadedFilesCubit, FetchDownloadedFilesState>(
      builder: (context, state) {
        if (state is FetchDownloadedFilesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchDownloadedFilesSuccess) {
          return UserFilesListView(
            pdfFiles: state.filesPaths,
          );
        } else if (state is FetchDownloadedFilesFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(
            child: Text('oops there was a problem'),
          );
        }
      },
    );
  }
}
