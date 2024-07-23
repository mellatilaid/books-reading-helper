import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<bool, List<File>>> getUserDownloadedPdfs();
}
