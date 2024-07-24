import 'dart:io';

import 'package:books_reading_helper/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<File>>> getUserDownloadedPdfs();
}
