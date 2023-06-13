import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/dims/dims.dart';
import 'package:netflix/core/strings/string.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

import '../../../application/bloc_search/bloc_search_bloc.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(title: 'Movies  & TV'),
        kHeight,
        Expanded(child: BlocBuilder<BlocSearchBloc, BlocSearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error while fetching data'),
              );
            } else if (state.searchResult.isEmpty) {
              return const Center(
                child: Text('No data to fetch'),
              );
            } else {
              return GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.5,
                shrinkWrap: true,
                children: List.generate(state.searchResult.length, (index) {
                  return MainMovieCard(
                    imageUrl: state.searchResult[index].backdropPath ?? '',
                  );
                }),
              );
            }
          },
        ))
      ],
    );
  }
}

class MainMovieCard extends StatelessWidget {
  const MainMovieCard({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
            image: NetworkImage('${imageBaseUrl + imageUrl}'),
            fit: BoxFit.cover),
      ),
    );
  }
}
