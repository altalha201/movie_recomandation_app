import 'package:flutter/material.dart';

import '../../../../models/serise_model.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/button/see_more_button.dart';
import '../../../widgets/list_item/serise_list_item.dart';

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
      padding: Constances.listMargin,
      child: SizedBox(
        height: Constances.listHeight,
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
