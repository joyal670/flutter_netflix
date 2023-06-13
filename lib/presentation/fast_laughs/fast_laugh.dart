import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/bloc_fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/fast_laughs/widgets/video_list_item.dart';

class FastLaughsScreen extends StatelessWidget {
  const FastLaughsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FastLaughBloc>(context).add(
      const FastLaughEvent.initilize(),
    );

    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while loading data'),
            );
          } else if (state.videoList.isEmpty) {
            return const Center(
              child: Text('No videos availabe, right now'),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videoList.length, (index) {
                return VideoListItemInheritedWidget(
                  widget: VideoListItem(index: index),
                  movieData: state.videoList[index],
                  key: Key(index.toString()),
                );
              }),
            );
          }
        },
      )),
    );
  }
}
