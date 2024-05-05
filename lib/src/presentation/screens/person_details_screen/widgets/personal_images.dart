import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/data_controller/person_room_controller.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/urls.dart';
import '../../../widgets/list_item/list_image_widget.dart';

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
            height: Constances.listHeight,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list?.length ?? 0,
              itemBuilder: (context, index) => ListImageWidget(
                list?[index].filePath != null
                    ? Urls.getImageUrl(list![index].filePath!)
                    : Urls.noPosterUrl,
                border: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
