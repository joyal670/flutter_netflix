import 'package:flutter/material.dart';
import 'package:netflix/core/dims/dims.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

final imageList =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(title: 'Movies  & TV'),
        kHeight,
        Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.5,
          shrinkWrap: true,
          children: List.generate(20, (index) {
            return const MainMovieCard();
          }),
        ))
      ],
    );
  }
}

class MainMovieCard extends StatelessWidget {
  const MainMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image:
            DecorationImage(image: NetworkImage(imageList), fit: BoxFit.cover),
      ),
    );
  }
}
