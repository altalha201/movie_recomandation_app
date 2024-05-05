import 'package:flutter/material.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:navigate/navigate.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/data_controller/person_room_controller.dart';
import '../../../widgets/list_item/list_image_widget.dart';
import '../../details_screen/details_screen.dart';

class CastIn extends StatelessWidget {
  const CastIn({super.key});

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<PersonRoomController>(
          context,
          listen: false,
        ).currentPage.knownFor ??
        [];

    if (list.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: MSConstances.listHeight,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) => ListImageWidget(
            (list[index].posterPath != null)
                ? EndPoints.getImageUrl(list[index].posterPath!)
                : EndPoints.noPosterUrl,
            border: true,
            onPressed: () {
              Navigate.push(
                context,
                DetailsScreen(
                  contentType: list[index].mediaType ?? "",
                  contentId: list[index].id ?? -1,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
