import 'package:flutter/material.dart';
import 'package:movie_recomandation_app/src/presentation/widgets/list_item/serise_list_item.dart';

import '../../../../models/serise_model.dart';
import '../../../widgets/button/see_more_button.dart';

class SeriseListView extends StatelessWidget {
  const SeriseListView({
    super.key,
    required this.serises,
    this.onSeeMore,
  });

  final List<SeriseModel> serises;
  final VoidCallback? onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 196,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: serises.length + 1,
          itemBuilder: (context, index) {
            if (index < serises.length) {
              return SeriseListItem(item: serises.elementAt(index));
            }
            return SeeMoreButton(
              onTap: onSeeMore,
            );
          },
        ),
      ),
    );
  }
}
