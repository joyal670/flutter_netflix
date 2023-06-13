import 'package:flutter/material.dart';
import 'package:netflix/application/bloc_fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/strings/string.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(child: widget, key: key);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  @override
  Widget build(BuildContext context) {
    final imagePath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;

    final videoUrl = videoUrls[widget.index % videoUrls.length];

    late VideoPlayerController videoPlayerController =
        VideoPlayerController.network(videoUrl);

    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: (bool) {},
          videoPlayerController: videoPlayerController,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: ValueListenableBuilder(
                    valueListenable: isAudioNotifier,
                    builder: (BuildContext context, bool value, child) {
                      if (value) {
                        return IconButton(
                          onPressed: () {
                            videoPlayerController.setVolume(1.0);
                            isAudioNotifier.value = false;
                          },
                          icon: const Icon(
                            Icons.volume_off,
                            color: Colors.white,
                            size: 30,
                          ),
                        );
                      } else {
                        return IconButton(
                          onPressed: () {
                            videoPlayerController.setVolume(0.0);
                            isAudioNotifier.value = true;
                          },
                          icon: const Icon(
                            Icons.volume_up,
                            color: Colors.white,
                            size: 30,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: imagePath == null
                            ? null
                            : NetworkImage(imageBaseUrl + imagePath),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likesVideosNotifier,
                      builder:
                          (BuildContext context, Set<int> newLikedList, _) {
                        final _index = widget.index;
                        if (newLikedList.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(unLikeVideo(id: _index));
                              likesVideosNotifier.value.remove(_index);
                              likesVideosNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                                icon: Icons.favorite, title: 'Liked'),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(likeVideo(id: _index));
                              likesVideosNotifier.value.add(_index);
                              likesVideosNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                                icon: Icons.emoji_emotions, title: 'LOL'),
                          );
                        }
                      },
                    ),
                    //  const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                        onTap: () {
                          final movieName =
                              VideoListItemInheritedWidget.of(context)!
                                  .movieData
                                  .title;
                          if (movieName != null) {
                            Share.share(movieName);
                          }
                        },
                        child: const VideoActionsWidget(
                            icon: Icons.share, title: 'Share')),
                    ValueListenableBuilder(
                      valueListenable: isPlayingNotifier,
                      builder: (BuildContext context, bool value, child) {
                        if (value) {
                          return GestureDetector(
                              onTap: () {
                                videoPlayerController.play();
                                isPlayingNotifier.value = false;
                              },
                              child: const VideoActionsWidget(
                                  icon: Icons.play_arrow, title: 'Play'));
                        } else {
                          return GestureDetector(
                              onTap: () {
                                videoPlayerController.pause();
                                isPlayingNotifier.value = true;
                              },
                              child: const VideoActionsWidget(
                                  icon: Icons.pause, title: 'Pause'));
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  late VideoPlayerController videoPlayerController;

  FastLaughVideoPlayer(
      {super.key,
      required this.videoUrl,
      required this.onStateChanged,
      required this.videoPlayerController});

  @override
  State<FastLaughVideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<FastLaughVideoPlayer> {
  @override
  void initState() {
    widget.videoPlayerController.initialize().then((value) {
      setState(() {
        widget.videoPlayerController.play();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: widget.videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: widget.videoPlayerController.value.aspectRatio,
              child: VideoPlayer(widget.videoPlayerController))
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    super.dispose();
  }
}
