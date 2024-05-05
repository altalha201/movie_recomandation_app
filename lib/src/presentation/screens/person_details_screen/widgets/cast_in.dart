import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/data_controller/person_room_controller.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/navigation_helper.dart';
import '../../../../utils/urls.dart';
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
        height: Constances.listHeight,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) => ListImageWidget(
            (list[index].posterPath != null)
                ? Urls.getImageUrl(list[index].posterPath!)
                : Urls.noPosterUrl,
            border: true,
            onPressed: () {
              NavigationHelper.push(
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
