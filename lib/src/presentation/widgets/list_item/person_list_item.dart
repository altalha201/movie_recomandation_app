import 'package:flutter/material.dart';

import '../../../models/person_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/navigation_helper.dart';
import '../../../utils/urls.dart';
import '../../screens/details_screen/content_cheacker.dart';

class PersonListItem extends StatelessWidget {
  const PersonListItem(this.person, {super.key});

  final PersonModel person;

  void _onTap(BuildContext context) {
    NavigationHelper.push(
      context,
      ContentChecker(
        contentType: "person",
        contentId: person.id ?? -1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        height: Constances.listItemHeight,
        width: Constances.listItemWeight,
        margin: Constances.listItemMargin,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(person.profilePath != null
                ? Urls.getImageUrl(person.profilePath!)
                : Urls.noPosterUrl),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: nameSection(),
      ),
    );
  }

  Widget nameSection() {
    return Container(
      width: double.infinity,
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8.0),
        ),
        color: Colors.red,
      ),
      alignment: Alignment.center,
      child: Text(
        person.name ?? "Name",
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
