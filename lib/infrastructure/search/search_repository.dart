import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_model/search_model.dart';
import 'package:netflix/domain/search/repo/search_repo.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: SearchRepo)
class SearchRepository implements SearchRepo {
  @override
  Future<Either<MainFailure, SearchModel>> searchMovies(
      {required String moviequery}) async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': moviequery,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result =
            SearchModel.fromJson(response.data as Map<String, dynamic>);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
