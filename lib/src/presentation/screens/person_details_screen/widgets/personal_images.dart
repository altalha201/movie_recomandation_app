import 'package:flutter/material.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:provider/provider.dart';

import '../../../../utils/exports.dart';

class PersonalImages extends StatelessWidget {
  const PersonalImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonRoomController>(
      builder: (context, controller, _) {
        var list = controller.currentPage.images;
        if (list?.isEmpty ?? true) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: MSConstances.listHeight,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list?.length ?? 0,
              itemBuilder: (context, index) => ListImageWidget(
                list?[index].filePath != null
                    ? EndPoints.getImageUrl(list![index].filePath!)
                    : EndPoints.noPosterUrl,
                border: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
