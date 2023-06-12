import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/CustomButtonWidget.dart';
import 'package:netflix/presentation/new_and_hot/videoWidget.dart';

import '../../core/dims/dims.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarWidget(),
        body: TabBarView(
          children: [
            _tabCommingSoon(),
            _tabEveryOneWatching(),
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

  Widget _tabEveryOneWatching() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return const ListItemViewTwoWidget();
        });
  }

  Widget _tabCommingSoon() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return const ListItemViewOneWidget();
        });
  }
}

class ListItemViewTwoWidget extends StatelessWidget {
  const ListItemViewTwoWidget({
    super.key,
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
          VideoWidget(),
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
  const ListItemViewOneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          const SizedBox(
            width: 70,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'FEB',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '11',
                  style: TextStyle(
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(),
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'John Wick',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    CustomButtonWidget(
                      iconData: Icons.notifications,
                      title: "Remind me",
                      iconSize: 20,
                      titleSize: 10,
                    ),
                    kWidth,
                    CustomButtonWidget(
                      iconData: Icons.info,
                      title: "Info",
                      iconSize: 20,
                      titleSize: 10,
                    ),
                    kWidth
                  ],
                ),
                kHeight,
                Text('Comming on Firday'),
                kHeight,
                Text(
                  'John Wick ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight,
                Text(
                  'Landing in the school musical is a dream come true for Jodi, until the pressure sends her confidence - and here relationship - into a tailspain.',
                  style: TextStyle(
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
