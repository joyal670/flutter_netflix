import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix/domain/downloads/repo/download_repo.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/failures/main_failure.dart';

part 'downloads_bloc_bloc.freezed.dart';
part 'downloads_bloc_event.dart';
part 'downloads_bloc_state.dart';

@Injectable()
class DownloadsBlocBloc extends Bloc<DownloadEvents, DownloadsState> {
  final DownloadResp _downloadResp;
  DownloadsBlocBloc(this._downloadResp) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      // start api call
      // start loader
      emit(state.copyWith(
        isLoading: true,
        downloadFailureOrSuccessOption: none(),
      ));

      // api calling
      // dissmiss loader
      final dRepo = await _downloadResp.getDownloadsImages();
      print(dRepo.toString());
      emit(dRepo.fold(
        (failure) => state.copyWith(
            // handle failure
            isLoading: false,
            downloadFailureOrSuccessOption: Some(
              Left(failure),
            )),
        (success) => state.copyWith(
            // handle success
            isLoading: false,
            downloads: success,
            downloadFailureOrSuccessOption: Some(
              Right(success),
            )),
      ));
    });
  }
}
