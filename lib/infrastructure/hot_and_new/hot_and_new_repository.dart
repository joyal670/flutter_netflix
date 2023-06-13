import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new/model/new_and_hot_response.dart';
import 'package:netflix/domain/hot_and_new/repo/hot_and_new_repo.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: HotAndNewRepo)
class HotAndNewRepository implements HotAndNewRepo {
  @override
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewMovieData() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result =
            NewAndHotResponse.fromJson(response.data as Map<String, dynamic>);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result =
            NewAndHotResponse.fromJson(response.data as Map<String, dynamic>);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
