import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:navigate/navigate.dart';

import '../../../utils/exports.dart';

class PersonListItem extends StatelessWidget {
  const PersonListItem(this.person, {super.key});

  final PersonModel person;

  void _onTap(BuildContext context) {
    Navigate.push(
      context,
      DetailsScreen(
        contentType: "person",
        contentId: person.id ?? -1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var imgPath = person.profilePath != null
        ? EndPoints.getImageUrl(person.profilePath!)
        : EndPoints.noPosterUrl;
    return ListImageWidget(
      imgPath,
      onPressed: () => _onTap(context),
      childAlignment: Alignment.bottomCenter,
      child: _nameSection(),
    );
  }

  Widget _nameSection() {
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
