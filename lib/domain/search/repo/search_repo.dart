import 'package:dartz/dartz.dart';
import 'package:netflix/domain/failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_model/search_model.dart';

import '../model/search_model/result.dart';

abstract class SearchRepo {
  Future<Either<MainFailure, SearchModel>> searchMovies(
      {required String moviequery});
}
