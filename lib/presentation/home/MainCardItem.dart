import 'package:flutter/material.dart';

import '../../core/dims/dims.dart';

class MainCardItem extends StatelessWidget {
  const MainCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: radius10,
          image: DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg'))),
    );
  }
}
