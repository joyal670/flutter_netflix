part of 'bloc_search_bloc.dart';

@freezed
class BlocSearchState with _$BlocSearchState {
  const factory BlocSearchState({
    required List<SearchResultData> searchResult,
    required List<Downloads> idleLiast,
    required bool isLoading,
    required bool isError,
  }) = _BlocSearchState;

  factory BlocSearchState.initial() => const BlocSearchState(
        searchResult: [],
        idleLiast: [],
        isLoading: false,
        isError: false,
      );
}
