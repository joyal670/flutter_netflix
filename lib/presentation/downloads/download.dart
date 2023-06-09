// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:netflix/core/dims/dims.dart';
import 'package:netflix/presentation/common_widgets/app_bar.dart';

import '../../core/colors/colors.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final widgetList = [
    const SmartDownloadWidget(),
    Section2(),
    const Section3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: widgetList.length));
  }
}

class SmartDownloadWidget extends StatelessWidget {
  const SmartDownloadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: colorWhite,
        ),
        kWidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          style: TextStyle(
              color: colorWhite, fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          'We will download a personalised selection of movies and shows for you, so there is always something to watch on your device.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        height30,
        SizedBox(
          width: screenSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: screenSize.width * 0.42,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadImageList(
                image: imageList[0],
                rotationAngle: 10,
                margin: const EdgeInsets.only(left: 180, bottom: 10),
                size: Size(screenSize.width * 0.30, screenSize.height * 0.30),
                borderRadius: 7,
              ),
              DownloadImageList(
                image: imageList[1],
                rotationAngle: -10,
                margin: const EdgeInsets.only(right: 180, bottom: 10),
                size: Size(screenSize.width * 0.30, screenSize.height * 0.30),
                borderRadius: 7,
              ),
              DownloadImageList(
                image: imageList[2],
                margin: const EdgeInsets.only(left: 0),
                size: Size(screenSize.width * 0.48, screenSize.height * 0.34),
                borderRadius: 7,
              ),
            ],
          ),
        ),
        height30
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: colorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: colorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: colorWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: colorBlack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        kHeight
      ],
    );
  }
}

class DownloadImageList extends StatelessWidget {
  const DownloadImageList({
    Key? key,
    required this.image,
    this.rotationAngle = 0,
    required this.margin,
    required this.size,
    required this.borderRadius,
  }) : super(key: key);

  final String image;
  final double rotationAngle;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle * pi / 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image))),
        ),
      ),
    );
  }
}
