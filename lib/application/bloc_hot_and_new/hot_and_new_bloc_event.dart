part of 'hot_and_new_bloc_bloc.dart';

@freezed
class HotAndNewBlocEvent with _$HotAndNewBlocEvent {
  const factory HotAndNewBlocEvent.loadCommingSoon() = LoadCommingSoon;
  const factory HotAndNewBlocEvent.loadEveryOneIsWatchingSoon() =
      loadEveryOneIsWatchingSoon;
}
