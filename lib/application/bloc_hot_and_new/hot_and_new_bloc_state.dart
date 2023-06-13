part of 'hot_and_new_bloc_bloc.dart';

@freezed
class HotAndNewBlocState with _$HotAndNewBlocState {
  const factory HotAndNewBlocState({
    required List<HotAndNewData> commingSoon,
    required List<HotAndNewData> everyOneIsWatchingSoon,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HotAndNewBlocState.initial() => const HotAndNewBlocState(
      commingSoon: [],
      everyOneIsWatchingSoon: [],
      isError: false,
      isLoading: false);
}
