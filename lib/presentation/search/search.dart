import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/dims/dims.dart';
import 'package:netflix/presentation/search/widget/search_idle.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';

import '../../application/bloc_search/bloc_search_bloc.dart';
import '../../domain/core/debouncer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // to make a delay while typing
    final _debouncer = Debouncer(milliseconds: 500);

    BlocProvider.of<BlocSearchBloc>(context)
        .add(BlocSearchEvent.initialSearch());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }
                _debouncer.run(() {
                  BlocProvider.of<BlocSearchBloc>(context)
                      .add(BlocSearchEvent.searchMovie(movieQuery: value));
                });
              },
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
            ),
            kHeight,
            BlocBuilder<BlocSearchBloc, BlocSearchState>(
              builder: (context, state) {
                if (state.searchResult.isEmpty) {
                  return const Expanded(child: SearchIdleWidget());
                } else {
                  return const Expanded(child: SearchResultWidget());
                }
              },
            ),
            kHeight,
          ],
        ),
      )),
    );
  }
}
