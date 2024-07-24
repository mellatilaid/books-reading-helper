import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo/home_repo_impl.dart';

part 'fetch_downloaded_files_state.dart';

class FetchDownloadedFilesCubit extends Cubit<FetchDownloadedFilesState> {
  FetchDownloadedFilesCubit() : super(FetchDownloadedFilesInitial());

  Future<void> getUserDownloadedPdfs() async {
    emit(FetchDownloadedFilesLoading());
    final resault = await HomeRepoImpl().getUserDownloadedPdfs();
    resault.fold((failure) {
      emit(FetchDownloadedFilesFailure(failure.errMessage));
    }, (files) {
      emit(FetchDownloadedFilesSuccess(files));
    });
  }
}
