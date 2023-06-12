import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/failures/main_failure.dart';
import 'package:netflix/domain/search/repo/search_repo.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/downloads/repo/download_repo.dart';
import '../../domain/search/model/search_model/result.dart';
import '../../domain/search/model/search_model/search_model.dart';

part 'bloc_search_event.dart';
part 'bloc_search_state.dart';
part 'bloc_search_bloc.freezed.dart';

@injectable
class BlocSearchBloc extends Bloc<BlocSearchEvent, BlocSearchState> {
  final DownloadResp _downloadResp;
  final SearchRepo _searchRepo;

  BlocSearchBloc(this._searchRepo, this._downloadResp)
      : super(BlocSearchState.initial()) {
    on<_InitialSearch>((event, emit) async {
      // get trending

      // if (state.idleLiast.isNotEmpty) {
      //   BlocSearchState(
      //     searchResult: [],
      //     idleLiast: state.idleLiast,
      //     isLoading: false,
      //     isError: false,
      //   );
      //   return;
      // }

      //loading
      emit(const BlocSearchState(
        searchResult: [],
        idleLiast: [],
        isLoading: true,
        isError: false,
      ));

      //api call
      final dRepo = await _downloadResp.getDownloadsImages();
      final result = dRepo.fold((MainFailure f) {
        return const BlocSearchState(
          searchResult: [],
          idleLiast: [],
          isLoading: false,
          isError: true,
        );
      }, (List<Downloads> list) {
        return BlocSearchState(
          searchResult: [],
          idleLiast: list,
          isLoading: false,
          isError: false,
        );
      });
      emit(result);
    });

    on<_SearchMovie>((event, emit) async {
      //call search api
      final response =
          await _searchRepo.searchMovies(moviequery: event.movieQuery);
      final result = response.fold((MainFailure f) {
        return const BlocSearchState(
          searchResult: [],
          idleLiast: [],
          isLoading: false,
          isError: true,
        );
      }, (SearchModel model) {
        return BlocSearchState(
          searchResult: model.results!,
          idleLiast: [],
          isLoading: false,
          isError: false,
        );
      });
      emit(result);
    });
  }
}
