import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/downloads/repo/download_repo.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrls = [
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4'
];

ValueNotifier<Set<int>> likesVideosNotifier = ValueNotifier({});
ValueNotifier<bool> isPlayingNotifier = ValueNotifier(false);
ValueNotifier<bool> isAudioNotifier = ValueNotifier(false);

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(DownloadResp downloadRepo) : super(FastLaughState.initial()) {
    on<Initilize>((event, emit) async {
      // get trending movies

      // loading
      emit(const FastLaughState(
        videoList: [],
        isLoading: true,
        isError: false,
      ));

      final result = await downloadRepo.getDownloadsImages();
      print(result);
      final _state = result.fold((l) {
        return const FastLaughState(
          videoList: [],
          isLoading: false,
          isError: true,
        );
      },
          (response) => FastLaughState(
                videoList: response,
                isLoading: false,
                isError: false,
              ));

      emit(_state);

      //add movies
    });
  }
}
