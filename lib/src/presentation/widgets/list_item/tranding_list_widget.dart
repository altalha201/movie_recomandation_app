import 'package:flutter/material.dart';

import '../../../models/tranding_list_item.dart';
import '../../../utils/navigation_helper.dart';
import '../../../utils/urls.dart';
import '../../screens/details_screen/details_screen.dart';
import '../cards/percentage_widget.dart';

class TrandingListWidget extends StatelessWidget {
  final TrandingListItem data;
  const TrandingListWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationHelper.push(
          context,
          DetailsScreen(
            contentType: data.mediaType ?? "",
            contentId: data.id ?? -1,
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                (data.posterPath != null)
                    ? Urls.getImageUrl(data.posterPath!)
                    : Urls.noPosterUrl,
              ),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(16),
          child: PercentageWidget(
            percentage: data.votePercentage ?? 0,
          ),
        ),
      ),
    );
  }
}
