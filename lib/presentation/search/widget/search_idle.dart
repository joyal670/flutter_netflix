import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix/core/dims/dims.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

final imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/rH3jY9JN9krUyE0Q3WLNtujMs8.jpg';

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const SearchTitleText(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: ListView.separated(
              itemBuilder: (ctx, index) => TopSearchItem(),
              separatorBuilder: (ctx, index) => height30,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  const TopSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenWidgth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: _screenWidgth * 0.4,
          height: 90,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        kWidth,
        const Expanded(
            child: Text(
          'Movie name',
          style: TextStyle(
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