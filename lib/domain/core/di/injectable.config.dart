// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix/application/bloc/bloc_search_bloc.dart' as _i8;
import 'package:netflix/application/bloc_download/downloads_bloc_bloc.dart'
    as _i5;
import 'package:netflix/domain/downloads/repo/download_repo.dart' as _i3;
import 'package:netflix/domain/search/repo/search_repo.dart' as _i6;
import 'package:netflix/infrastructure/downloads/download_repository.dart'
    as _i4;
import 'package:netflix/infrastructure/search/search_repository.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DownloadResp>(() => _i4.DownloadRepository());
    gh.factory<_i5.DownloadsBlocBloc>(
        () => _i5.DownloadsBlocBloc(gh<_i3.DownloadResp>()));
    gh.lazySingleton<_i6.SearchRepo>(() => _i7.SearchRepository());
    gh.factory<_i8.BlocSearchBloc>(() => _i8.BlocSearchBloc(
          gh<_i6.SearchRepo>(),
          gh<_i3.DownloadResp>(),
        ));
    return this;
  }
}
