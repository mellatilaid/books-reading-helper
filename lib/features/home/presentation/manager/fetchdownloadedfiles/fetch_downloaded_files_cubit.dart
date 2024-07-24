import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_downloaded_files_state.dart';

class FetchDownloadedFilesCubit extends Cubit<FetchDownloadedFilesState> {
  FetchDownloadedFilesCubit() : super(FetchDownloadedFilesInitial());
}
