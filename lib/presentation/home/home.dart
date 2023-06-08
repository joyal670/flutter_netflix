import 'package:flutter/material.dart';

import 'MainTitleCard.dart';
import 'NumberWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              MainTitleCard(
                title: 'Released in past years',
              ),
              MainTitleCard(
                title: 'Tending Now',
              ),
              NumberWidget(),
              MainTitleCard(
                title: 'Tense Dramas',
              ),
              MainTitleCard(
                title: 'South Indian Cinema',
              )
            ],
          ),
        ),
      ),
    );
  }
}
