part of 'fetch_downloaded_files_cubit.dart';

@immutable
sealed class FetchDownloadedFilesState {}

final class FetchDownloadedFilesInitial extends FetchDownloadedFilesState {}

final class FetchDownloadedFilesLoading extends FetchDownloadedFilesState {}

final class FetchDownloadedFilesSuccess extends FetchDownloadedFilesState {
  final List<File> pdfFiles;

  FetchDownloadedFilesSuccess(this.pdfFiles);
}

final class FetchDownloadedFilesFailure extends FetchDownloadedFilesState {
  final String errMessage;

  FetchDownloadedFilesFailure(this.errMessage);
}