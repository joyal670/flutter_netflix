import 'package:flutter/material.dart';

import '../../core/dims/dims.dart';
import '../search/widget/search_title.dart';
import 'number_card.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(title: 'Top 10 Tv shows in Indian today'),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => NumberCard(
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
