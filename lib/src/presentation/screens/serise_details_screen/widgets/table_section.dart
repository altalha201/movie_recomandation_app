import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:provider/provider.dart';

import '../../../../utils/exports.dart';

class TableSection extends StatelessWidget {
  const TableSection({super.key});

  TableModel _getTabledata(SeriseRoomController provider) {
    List<TableRowModel> rows = [];
    var current = provider.currentPage;
    if (current.originalName != null) {
      rows.add(
        TableRowModel(
          title: "Orginal Name",
          data: current.originalName ?? "",
        ),
      );
    }
    if (current.type != null) {
      rows.add(
        TableRowModel(
          title: "Type",
          data: current.type ?? "",
        ),
      );
    }
    if (current.episodeRunTime?.isNotEmpty ?? false) {
      List<String> ls = [];
      current.episodeRunTime?.forEach((element) {
        ls.add(MSFunctions.convertMinutes(element));
      });
      rows.add(
        TableRowModel(
          title: "Episodes Run Times",
          data: ls.join(", "),
        ),
      );
    }
    if (current.firstAirDate != null) {
      rows.add(
        TableRowModel(
          title: "First Airing Date",
          data: current.firstAirDate ?? "",
        ),
      );
    }

    if (current.inProduction != null) {
      rows.add(
        TableRowModel(
          title: "In Production",
          data: (current.inProduction ?? false) ? "Yes" : "No",
        ),
      );
    }

    if (current.lastAirDate != null) {
      rows.add(
        TableRowModel(
          title: "Last Airing Date",
          data: current.lastAirDate ?? "",
        ),
      );
    }

    if (current.networks?.isNotEmpty ?? false) {
      rows.add(
        TableRowModel(
          title: "Networks",
          data: CoreFunctions.getCompanies(
            current.networks,
          ),
        ),
      );
    }

    if (current.productionCompanies?.isNotEmpty ?? false) {
      rows.add(
        TableRowModel(
          title: "Production Companies",
          data: CoreFunctions.getCompanies(
            current.productionCompanies,
          ),
        ),
      );
    }
    return TableModel(rows: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTable(
            table: _getTabledata(provider),
          ),
        );
      },
    );
  }
}
