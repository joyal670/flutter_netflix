import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/dashboard/widgets/bottom_nav.dart';
import 'package:netflix/presentation/downloads/download.dart';
import 'package:netflix/presentation/fast_laughs/fast_laugh.dart';
import 'package:netflix/presentation/home/home.dart';
import 'package:netflix/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix/presentation/search/search.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final _pages = [
    HomeScreen(),
    NewAndHotScreen(),
    FastLaughsScreen(),
    SearchScreen(),
    DownloadScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: bottomNavigationIndex,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
