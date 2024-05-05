import 'package:flutter/material.dart';

import '../../../models/list_item/search_model.dart';
import '../../../utils/navigation_helper.dart';
import '../../../utils/urls.dart';
import '../../screens/details_screen/details_screen.dart';
import '../cards/popularity_widget.dart';
import '../cards/ratting_widget.dart';
import '../tags/tag_widget.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({
    super.key,
    required this.item,
  });

  final SearchModel item;

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
              _Poster(item.posterPath),
              const SizedBox(width: 12),
              _Details(item: item),
            ],
          ),
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({
    required this.item,
  });

  final SearchModel item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title ?? item.name ?? "Unkonwn",
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
              if (item.adult ?? false)
                const TagWidget(
                  text: "Adult",
                  color: Colors.red,
                ),
              RattingWidget((item.votePercentage ?? 0) / 10.0),
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
      ),
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster(this.posterPath);

  final String? posterPath;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Container(
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(
              posterPath != null
                  ? Urls.getImageUrl(posterPath!)
                  : Urls.noPosterUrl,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
