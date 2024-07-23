import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/Failures.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<File>>> getUserDownloadedPdfs();
}
