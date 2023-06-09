import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/dims/dims.dart';

import 'CustomButtonWidget.dart';
import 'MainTitleCard.dart';
import 'NumberWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;

                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        children: [
                          backgroundCard(),
                          const MainTitleCard(
                            title: 'Released in past years',
                          ),
                          const MainTitleCard(
                            title: 'Tending Now',
                          ),
                          const NumberWidget(),
                          const MainTitleCard(
                            title: 'Tense Dramas',
                          ),
                          const MainTitleCard(
                            title: 'South Indian Cinema',
                          )
                        ],
                      ),
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            child: Container(
                              width: double.infinity,
                              height: 90,
                              color: Colors.black.withOpacity(0.5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Netflix_icon.svg/2048px-Netflix_icon.svg.png',
                                          width: 50,
                                          height: 50),
                                      const Spacer(),
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Tv Shows',
                                          style: homeTitleTextStyle,
                                        ),
                                        Text(
                                          'Movies',
                                          style: homeTitleTextStyle,
                                        ),
                                        Text(
                                          'Categories',
                                          style: homeTitleTextStyle,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : kHeight
                  ],
                ),
              );
            }));
  }

  Stack backgroundCard() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(mainImage))),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                iconData: Icons.add,
                title: 'My List',
              ),
              playButton(),
              const CustomButtonWidget(
                iconData: Icons.info,
                title: 'Info',
              )
            ],
          ),
        )
      ],
    );
  }

  TextButton playButton() {
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(colorWhite)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: colorBlack,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: colorBlack),
        ),
      ),
    );
  }
}
