import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

import '../../failures/main_failure.dart';

abstract class DownloadResp {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
