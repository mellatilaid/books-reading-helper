import 'package:books_reading_helper/core/errors/failures.dart';
import 'package:books_reading_helper/core/utils/const.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BooksType>>> getUserDownloadedPdfs();
}
