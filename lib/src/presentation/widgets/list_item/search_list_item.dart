import 'package:flutter/material.dart';

import '../../../models/media_model.dart';
import '../../../utils/navigation_helper.dart';
import '../../../utils/urls.dart';
import '../../screens/details_screen/details_screen.dart';
import '../cards/ratting_widget.dart';
import '../tags/tag_widget.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({
    super.key,
    required this.item,
  });

  final MediaModel item;

  void goToDetails(BuildContext context) {
    NavigationHelper.push(
      context,
      DetailsScreen(
        contentType: item.mediaType ?? "",
        contentId: item.id ?? -1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToDetails(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: SizedBox(
          height: 240,
          child: Row(
            children: [
              poster(),
              const SizedBox(width: 12),
              Expanded(
                child: detailsSection(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item.mediaTitle ?? "Unkonwn",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            TagWidget(
              text: item.mediaType?.toUpperCase() ?? "Unknown",
            ),
            RattingWidget((item.votePercentage ?? 0) * 1.0),
            // PopularityWidget(ratting: item.popularity ?? 0),
          ],
        ),
        const SizedBox(height: 6),
        // Text(
        //   item. ?? "",
        //   maxLines: 3,
        //   style: const TextStyle(color: Colors.grey),
        //   overflow: TextOverflow.ellipsis,
        //   textAlign: TextAlign.justify,
        // )
      ],
    );
  }

  Widget poster() {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Container(
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(
              item.posterPath != null
                  ? Urls.getImageUrl(item.posterPath!)
                  : Urls.noPosterUrl,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
