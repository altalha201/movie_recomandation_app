import 'package:flutter/material.dart';

import '../../../../models/person_model.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/list_item/person_list_item.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({super.key, required this.persons});

  final List<PersonModel> persons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constances.listMargin,
      child: SizedBox(
        height: Constances.listHeight,
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
    );
  }
}
