import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/dims/dims.dart';
import 'package:netflix/core/strings/string.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

import '../../../application/bloc_search/bloc_search_bloc.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const SearchTitleText(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: BlocBuilder<BlocSearchBloc, BlocSearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error while fetching data'),
                );
              } else if (state.idleLiast.isEmpty) {
                return const Center(
                  child: Text('No data to fetch'),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (ctx, index) => TopSearchItem(
                          title: state.idleLiast[index].title ?? '**',
                          imageUrl: state.idleLiast[index].posterPath ?? '',
                        ),
                    separatorBuilder: (ctx, index) => height30,
                    itemCount: state.idleLiast.length);
              }
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  const TopSearchItem({super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidgth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidgth * 0.4,
          height: 90,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('${imageBaseUrl + imageUrl}'),
                  fit: BoxFit.cover)),
        ),
        kWidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
