import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/hot_and_new/repo/hot_and_new_repo.dart';

import '../../domain/hot_and_new/model/new_and_hot_response.dart';

part 'hot_and_new_bloc_event.dart';
part 'hot_and_new_bloc_state.dart';
part 'hot_and_new_bloc_bloc.freezed.dart';

@Injectable()
class HotAndNewBlocBloc extends Bloc<HotAndNewBlocEvent, HotAndNewBlocState> {
  final HotAndNewRepo hotAndNewRepo;
  HotAndNewBlocBloc(this.hotAndNewRepo) : super(HotAndNewBlocState.initial()) {
    on<LoadCommingSoon>((event, emit) async {
      // loading
      emit(const HotAndNewBlocState(
        commingSoon: [],
        everyOneIsWatchingSoon: [],
        isLoading: true,
        isError: false,
      ));

      final result = await hotAndNewRepo.getHotAndNewMovieData();
      print(result);
      final _state = result.fold(
        (l) {
          return const HotAndNewBlocState(
            commingSoon: [],
            everyOneIsWatchingSoon: [],
            isLoading: false,
            isError: true,
          );
        },
        (r) {
          return HotAndNewBlocState(
            commingSoon: r.results,
            everyOneIsWatchingSoon: state.everyOneIsWatchingSoon,
            isLoading: false,
            isError: false,
          );
        },
      );

      emit(_state);
    });

    on<loadEveryOneIsWatchingSoon>((event, emit) async {
      // loading
      emit(const HotAndNewBlocState(
        commingSoon: [],
        everyOneIsWatchingSoon: [],
        isLoading: true,
        isError: false,
      ));

      final result = await hotAndNewRepo.getHotAndNewTvData();
      print(result);
      final _state = result.fold(
        (l) {
          return const HotAndNewBlocState(
            commingSoon: [],
            everyOneIsWatchingSoon: [],
            isLoading: false,
            isError: true,
          );
        },
        (r) {
          return HotAndNewBlocState(
            commingSoon: r.results,
            everyOneIsWatchingSoon: state.everyOneIsWatchingSoon,
            isLoading: false,
            isError: false,
          );
        },
      );

      emit(_state);
    });
  }
}
