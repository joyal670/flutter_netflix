part of 'bloc_search_bloc.dart';

@freezed
class BlocSearchEvent with _$BlocSearchEvent {
  const factory BlocSearchEvent.initialSearch() = _InitialSearch;
  const factory BlocSearchEvent.searchMovie({
    required String movieQuery,
  }) = _SearchMovie;
}
