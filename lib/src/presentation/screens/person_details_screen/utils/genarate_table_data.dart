import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/data_controller/person_room_controller.dart';

TableModel getTableData(BuildContext context) {
    TableModel model = TableModel(rows: []);
    var currentPerson = Provider.of<PersonRoomController>(context, listen: false).currentPage;
    if (currentPerson.gender != null) {
      model.rows.add(
        TableRowModel(
          title: "Gender",
          data: currentPerson.gender!,
        ),
      );
    }
    if (currentPerson.birthday != null) {
      model.rows.add(
        TableRowModel(
          title: "Birth Date",
          data: currentPerson.birthday!,
        ),
      );
    }
    if (currentPerson.deathday != null) {
      model.rows.add(
        TableRowModel(
          title: "Death Date",
          data: currentPerson.deathday!,
        ),
      );
    }
    if (currentPerson.deathday == null && currentPerson.birthday != null) {
      model.rows.add(
        TableRowModel(
          title: "Age",
          data: "${MSFunctions.getAgeFromDate(currentPerson.birthday!)} years",
        ),
      );
    }
    if (currentPerson.placeOfBirth != null) {
      model.rows.add(
        TableRowModel(
          title: "Place of Birth",
          data: currentPerson.placeOfBirth ?? "",
        ),
      );
    }
    if (currentPerson.alsoKnownAs?.isNotEmpty ?? false) {
      model.rows.add(
        TableRowModel(
          title: "Also Known As",
          data: currentPerson.alsoKnownAsString,
        ),
      );
    }
    return model;
  }