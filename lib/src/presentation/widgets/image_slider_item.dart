import 'package:flutter/material.dart';

import '../../models/list_item/media_model.dart';
import '../../utils/navigation_helper.dart';
import '../../utils/urls.dart';
import '../screens/details_screen/details_screen.dart';
import 'cards/ratting_widget.dart';

class ImageSliderItem extends StatelessWidget {
  const ImageSliderItem({
    super.key,
    required this.item,
    required this.trandingAt,
  });

  final MediaModel item;
  final int trandingAt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(8.0),
        decoration: imageDecorationSection(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "# ${trandingAt + 1}",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            RattingWidget(
              (item.votePercentage ?? 0) * 1.0,
            ),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    NavigationHelper.push(
      context,
      DetailsScreen(
        contentType: item.mediaType ?? "none",
        contentId: item.id ?? -1,
      ),
    );
  }

  BoxDecoration imageDecorationSection() {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(item.posterPath != null
            ? Urls.getImageUrl(item.posterPath!)
            : Urls.noPosterUrl),
        fit: BoxFit.fill,
        colorFilter: const ColorFilter.mode(
          Colors.black45,
          BlendMode.darken,
        ),
      ),
    );
  }
}
