// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlocSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialSearch,
    required TResult Function(String movieQuery) searchMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialSearch,
    TResult? Function(String movieQuery)? searchMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialSearch,
    TResult Function(String movieQuery)? searchMovie,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialSearch value) initialSearch,
    required TResult Function(_SearchMovie value) searchMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialSearch value)? initialSearch,
    TResult? Function(_SearchMovie value)? searchMovie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialSearch value)? initialSearch,
    TResult Function(_SearchMovie value)? searchMovie,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlocSearchEventCopyWith<$Res> {
  factory $BlocSearchEventCopyWith(
          BlocSearchEvent value, $Res Function(BlocSearchEvent) then) =
      _$BlocSearchEventCopyWithImpl<$Res, BlocSearchEvent>;
}

/// @nodoc
class _$BlocSearchEventCopyWithImpl<$Res, $Val extends BlocSearchEvent>
    implements $BlocSearchEventCopyWith<$Res> {
  _$BlocSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialSearchCopyWith<$Res> {
  factory _$$_InitialSearchCopyWith(
          _$_InitialSearch value, $Res Function(_$_InitialSearch) then) =
      __$$_InitialSearchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialSearchCopyWithImpl<$Res>
    extends _$BlocSearchEventCopyWithImpl<$Res, _$_InitialSearch>
    implements _$$_InitialSearchCopyWith<$Res> {
  __$$_InitialSearchCopyWithImpl(
      _$_InitialSearch _value, $Res Function(_$_InitialSearch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialSearch implements _InitialSearch {
  const _$_InitialSearch();

  @override
  String toString() {
    return 'BlocSearchEvent.initialSearch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialSearch,
    required TResult Function(String movieQuery) searchMovie,
  }) {
    return initialSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialSearch,
    TResult? Function(String movieQuery)? searchMovie,
  }) {
    return initialSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialSearch,
    TResult Function(String movieQuery)? searchMovie,
    required TResult orElse(),
  }) {
    if (initialSearch != null) {
      return initialSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialSearch value) initialSearch,
    required TResult Function(_SearchMovie value) searchMovie,
  }) {
    return initialSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialSearch value)? initialSearch,
    TResult? Function(_SearchMovie value)? searchMovie,
  }) {
    return initialSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialSearch value)? initialSearch,
    TResult Function(_SearchMovie value)? searchMovie,
    required TResult orElse(),
  }) {
    if (initialSearch != null) {
      return initialSearch(this);
    }
    return orElse();
  }
}

abstract class _InitialSearch implements BlocSearchEvent {
  const factory _InitialSearch() = _$_InitialSearch;
}

/// @nodoc
abstract class _$$_SearchMovieCopyWith<$Res> {
  factory _$$_SearchMovieCopyWith(
          _$_SearchMovie value, $Res Function(_$_SearchMovie) then) =
      __$$_SearchMovieCopyWithImpl<$Res>;
  @useResult
  $Res call({String movieQuery});
}

/// @nodoc
class __$$_SearchMovieCopyWithImpl<$Res>
    extends _$BlocSearchEventCopyWithImpl<$Res, _$_SearchMovie>
    implements _$$_SearchMovieCopyWith<$Res> {
  __$$_SearchMovieCopyWithImpl(
      _$_SearchMovie _value, $Res Function(_$_SearchMovie) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieQuery = null,
  }) {
    return _then(_$_SearchMovie(
      movieQuery: null == movieQuery
          ? _value.movieQuery
          : movieQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchMovie implements _SearchMovie {
  const _$_SearchMovie({required this.movieQuery});

  @override
  final String movieQuery;

  @override
  String toString() {
    return 'BlocSearchEvent.searchMovie(movieQuery: $movieQuery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchMovie &&
            (identical(other.movieQuery, movieQuery) ||
                other.movieQuery == movieQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchMovieCopyWith<_$_SearchMovie> get copyWith =>
      __$$_SearchMovieCopyWithImpl<_$_SearchMovie>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialSearch,
    required TResult Function(String movieQuery) searchMovie,
  }) {
    return searchMovie(movieQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialSearch,
    TResult? Function(String movieQuery)? searchMovie,
  }) {
    return searchMovie?.call(movieQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialSearch,
    TResult Function(String movieQuery)? searchMovie,
    required TResult orElse(),
  }) {
    if (searchMovie != null) {
      return searchMovie(movieQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialSearch value) initialSearch,
    required TResult Function(_SearchMovie value) searchMovie,
  }) {
    return searchMovie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialSearch value)? initialSearch,
    TResult? Function(_SearchMovie value)? searchMovie,
  }) {
    return searchMovie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialSearch value)? initialSearch,
    TResult Function(_SearchMovie value)? searchMovie,
    required TResult orElse(),
  }) {
    if (searchMovie != null) {
      return searchMovie(this);
    }
    return orElse();
  }
}

abstract class _SearchMovie implements BlocSearchEvent {
  const factory _SearchMovie({required final String movieQuery}) =
      _$_SearchMovie;

  String get movieQuery;
  @JsonKey(ignore: true)
  _$$_SearchMovieCopyWith<_$_SearchMovie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BlocSearchState {
  List<SearchResultData> get searchResult => throw _privateConstructorUsedError;
  List<Downloads> get idleLiast => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlocSearchStateCopyWith<BlocSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlocSearchStateCopyWith<$Res> {
  factory $BlocSearchStateCopyWith(
          BlocSearchState value, $Res Function(BlocSearchState) then) =
      _$BlocSearchStateCopyWithImpl<$Res, BlocSearchState>;
  @useResult
  $Res call(
      {List<SearchResultData> searchResult,
      List<Downloads> idleLiast,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$BlocSearchStateCopyWithImpl<$Res, $Val extends BlocSearchState>
    implements $BlocSearchStateCopyWith<$Res> {
  _$BlocSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = null,
    Object? idleLiast = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      searchResult: null == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<SearchResultData>,
      idleLiast: null == idleLiast
          ? _value.idleLiast
          : idleLiast // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlocSearchStateCopyWith<$Res>
    implements $BlocSearchStateCopyWith<$Res> {
  factory _$$_BlocSearchStateCopyWith(
          _$_BlocSearchState value, $Res Function(_$_BlocSearchState) then) =
      __$$_BlocSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SearchResultData> searchResult,
      List<Downloads> idleLiast,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$_BlocSearchStateCopyWithImpl<$Res>
    extends _$BlocSearchStateCopyWithImpl<$Res, _$_BlocSearchState>
    implements _$$_BlocSearchStateCopyWith<$Res> {
  __$$_BlocSearchStateCopyWithImpl(
      _$_BlocSearchState _value, $Res Function(_$_BlocSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = null,
    Object? idleLiast = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$_BlocSearchState(
      searchResult: null == searchResult
          ? _value._searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<SearchResultData>,
      idleLiast: null == idleLiast
          ? _value._idleLiast
          : idleLiast // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BlocSearchState implements _BlocSearchState {
  const _$_BlocSearchState(
      {required final List<SearchResultData> searchResult,
      required final List<Downloads> idleLiast,
      required this.isLoading,
      required this.isError})
      : _searchResult = searchResult,
        _idleLiast = idleLiast;

  final List<SearchResultData> _searchResult;
  @override
  List<SearchResultData> get searchResult {
    if (_searchResult is EqualUnmodifiableListView) return _searchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResult);
  }

  final List<Downloads> _idleLiast;
  @override
  List<Downloads> get idleLiast {
    if (_idleLiast is EqualUnmodifiableListView) return _idleLiast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idleLiast);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'BlocSearchState(searchResult: $searchResult, idleLiast: $idleLiast, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlocSearchState &&
            const DeepCollectionEquality()
                .equals(other._searchResult, _searchResult) &&
            const DeepCollectionEquality()
                .equals(other._idleLiast, _idleLiast) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchResult),
      const DeepCollectionEquality().hash(_idleLiast),
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlocSearchStateCopyWith<_$_BlocSearchState> get copyWith =>
      __$$_BlocSearchStateCopyWithImpl<_$_BlocSearchState>(this, _$identity);
}

abstract class _BlocSearchState implements BlocSearchState {
  const factory _BlocSearchState(
      {required final List<SearchResultData> searchResult,
      required final List<Downloads> idleLiast,
      required final bool isLoading,
      required final bool isError}) = _$_BlocSearchState;

  @override
  List<SearchResultData> get searchResult;
  @override
  List<Downloads> get idleLiast;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_BlocSearchStateCopyWith<_$_BlocSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
