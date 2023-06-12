import 'package:flutter/widgets.dart';

import '../../core/dims/dims.dart';
import '../search/widget/search_title.dart';
import 'MainCardItem.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.title});

  final title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitleText(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => const MainCardItem()),
          ),
        )
      ],
    );
  }
}
