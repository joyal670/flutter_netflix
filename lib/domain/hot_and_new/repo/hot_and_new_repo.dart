import 'package:dartz/dartz.dart';
import 'package:netflix/domain/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new/model/new_and_hot_response.dart';

abstract class HotAndNewRepo {
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewMovieData();
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewTvData();
}
