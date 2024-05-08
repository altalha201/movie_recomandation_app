import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';

import '../../../utils/exports.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({
    super.key,
    required this.persons,
    required this.title,
  });

  final String title;
  final List<PersonModel> persons;

  @override
  Widget build(BuildContext context) {
    if (persons.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title),
        Padding(
          padding: MSConstances.listMargin,
          child: SizedBox(
            height: MSConstances.listHeight,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: persons.length,
              itemBuilder: (context, index) => PersonListItem(
                persons[index],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
