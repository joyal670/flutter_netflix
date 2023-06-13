import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/bloc_hot_and_new/hot_and_new_bloc_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/strings/string.dart';
import 'package:netflix/presentation/home/CustomButtonWidget.dart';
import 'package:netflix/presentation/new_and_hot/videoWidget.dart';
import 'package:intl/intl.dart';

import '../../core/dims/dims.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarWidget(),
        body: const TabBarView(
          children: [
            CommingSoonList(
              key: Key('comming_soon'),
            ),
            EveryOneWatching(),
          ],
        ),
      ),
    );
  }

  PreferredSize AppBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
        title: Text(
          'New & hot',
          style:
              GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(
                Icons.cast,
                color: Colors.white,
              )),
          kWidth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),
          kWidth
        ],
        bottom: TabBar(
          isScrollable: true,
          tabs: const [
            Tab(
              text: '🍿 Comming Soon',
            ),
            Tab(
              text: "👀 Everyone's watching",
            )
          ],
          indicator: BoxDecoration(
            color: colorWhite,
            borderRadius: radius30,
          ),
          labelColor: colorBlack,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: colorWhite,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

class EveryOneWatching extends StatelessWidget {
  const EveryOneWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return SizedBox();
        });
  }
}

class CommingSoonList extends StatelessWidget {
  const CommingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBlocBloc>(context).add(LoadCommingSoon());
    });

    return BlocBuilder<HotAndNewBlocBloc, HotAndNewBlocState>(
      builder: (context, state) {
        if (state.isLoading) {
          return CircularProgressIndicator();
        } else if (state.isError) {
          return const Center(child: Text('Error while fetching data'));
        } else if (state.commingSoon.isEmpty) {
          return const Center(child: Text('No Data at this moment'));
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.commingSoon.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.commingSoon[index];

                String month = '';
                String day = '';
                try {
                  final date = DateTime.parse(movie.releaseDate!);
                  final formattedDate = DateFormat.yMMMd('en_US').format(date);
                  month = formattedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  day = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = "";
                  day = '';
                }
                return ListItemViewOneWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: day,
                  posterPath: imageBaseUrl + movie.posterPath!,
                  movieName: movie.originalTitle ?? 'no title',
                  description: movie.overview ?? 'no description',
                );
              });
        }
      },
    );
  }
}

class ListItemViewTwoWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const ListItemViewTwoWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            'Friends',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            'This hit sitcom follws the merry misadventures of six 20-something plas as they navigate the pitfalls of the work, life and love in 1990s Manhattan',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          height50,
          VideoWidget(
            imageUrl: '',
          ),
          height5,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                iconData: Icons.share,
                title: "Share",
                iconSize: 25,
                titleSize: 16,
              ),
              kWidth,
              CustomButtonWidget(
                iconData: Icons.add,
                title: "My list",
                iconSize: 25,
                titleSize: 16,
              ),
              kWidth,
              CustomButtonWidget(
                iconData: Icons.play_arrow,
                title: "Play",
                iconSize: 25,
                titleSize: 16,
              ),
              kWidth
            ],
          ),
        ],
      ),
    );
  }
}

class ListItemViewOneWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ListItemViewOneWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  month,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width - 70,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(
                  imageUrl: posterPath,
                ),
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const CustomButtonWidget(
                      iconData: Icons.notifications,
                      title: "Remind me",
                      iconSize: 20,
                      titleSize: 10,
                    ),
                    kWidth,
                    const CustomButtonWidget(
                      iconData: Icons.info,
                      title: "Info",
                      iconSize: 20,
                      titleSize: 10,
                    ),
                    kWidth
                  ],
                ),
                kHeight,
                Text('Comming on $day $month'),
                kHeight,
                Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight,
                Text(
                  description,
                  maxLines: 4,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
