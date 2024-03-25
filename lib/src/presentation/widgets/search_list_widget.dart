import 'package:flutter/material.dart';

import '../../models/media_model.dart';
import '../../utils/urls.dart';
import '../screens/details_screen/content_cheacker.dart';
import 'popularity_widget.dart';
import 'ratting_widget.dart';
import 'tag_widget.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({
    super.key,
    required this.item,
  });

  final MediaModel item;

  void goToDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContentChecker(
          contentType: item.mediaType ?? "",
          contentId: item.id ?? 0,
        ),
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
          item.name ?? item.title ?? "Unkonwn",
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
            RattingWidget(ratting: item.voteAverage ?? 0),
            PopularityWidget(ratting: item.popularity ?? 0),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          item.overview ?? "",
          maxLines: 3,
          style: const TextStyle(color: Colors.grey),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        )
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
