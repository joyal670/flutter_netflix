// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/bloc_download/downloads_bloc_bloc.dart';

import 'package:netflix/core/dims/dims.dart';
import 'package:netflix/presentation/common_widgets/app_bar.dart';

import '../../core/colors/colors.dart';
import '../../core/strings/string.dart';

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
    return const Row(
      children: [
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBlocBloc>(context)
    //       .add(const DownloadEvents.getDownloadsImages());
    // });

    BlocProvider.of<DownloadsBlocBloc>(context)
        .add(const DownloadEvents.getDownloadsImages());

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
        BlocBuilder<DownloadsBlocBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: screenSize.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: screenSize.width * 0.42,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                        DownloadImageList(
                          image:
                              '$imageBaseUrl${state.downloads[0].posterPath}',
                          rotationAngle: 10,
                          margin: const EdgeInsets.only(left: 180, bottom: 10),
                          size: Size(screenSize.width * 0.30,
                              screenSize.height * 0.30),
                          borderRadius: 7,
                        ),
                        DownloadImageList(
                          image:
                              '$imageBaseUrl${state.downloads[1].posterPath}',
                          rotationAngle: -10,
                          margin: const EdgeInsets.only(right: 180, bottom: 10),
                          size: Size(screenSize.width * 0.30,
                              screenSize.height * 0.30),
                          borderRadius: 7,
                        ),
                        DownloadImageList(
                          image:
                              '$imageBaseUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(left: 0),
                          size: Size(screenSize.width * 0.48,
                              screenSize.height * 0.34),
                          borderRadius: 7,
                        ),
                      ],
                    ),
            );
          },
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
