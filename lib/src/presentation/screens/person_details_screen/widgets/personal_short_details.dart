import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/person_room_controller.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/button/favourite_button.dart';

class PersonalShortDetails extends StatelessWidget {
  const PersonalShortDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonRoomController>(builder: (context, controller, _) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ProfileImage(
            controller.profileImageUrl,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _NameSection(
                  controller.currentPage.name ?? "Name",
                  controller.currentPage.knownForDepartment ?? "",
                ),
                const SizedBox(height: 16),
                FavouriteButton(
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
        ],
      );
    });
  }
}

class _ProfileImage extends StatelessWidget {
  final String imagePath;
  const _ProfileImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constances.listItemHeight,
      width: Constances.listItemWeight,
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            offset: const Offset(1, 5),
            blurStyle: BlurStyle.outer,
            blurRadius: 24,
          )
        ],
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _NameSection extends StatelessWidget {
  final String name;
  final String knownForDepartment;
  const _NameSection(
    this.name,
    this.knownForDepartment,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(name),
      subtitle: Text("Known for $knownForDepartment"),
      titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      textColor: Colors.white,
    );
  }
}
