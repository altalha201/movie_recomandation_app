import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:provider/provider.dart';

import '../../../../utils/exports.dart';

class MovieTableSection extends StatelessWidget {
  const MovieTableSection({super.key});

  TableModel _getTabledata(MovieRoomController provider) {
    List<TableRowModel> rows = [];
    var current = provider.currentMovie;
    if (current.originalTitle != null) {
      rows.add(
        TableRowModel(
          title: "Orginal Title",
          data: current.originalTitle ?? "",
        ),
      );
    }
    if (current.releaseDate != null) {
      rows.add(
        TableRowModel(
          title: "Release Date",
          data: current.releaseDate ?? "",
        ),
      );
    }
    if (current.budget != null) {
      rows.add(
        TableRowModel(
          title: "Budget",
          data: "USD ${MSFunctions.formatCurrency(
            current.budget ?? 0,
          )}",
        ),
      );
    }
    if (current.revenue != null) {
      rows.add(
        TableRowModel(
          title: "Revenue",
          data: "USD ${MSFunctions.formatCurrency(
            current.revenue ?? 0,
          )}",
        ),
      );
    }
    if (current.productionCompanies?.isNotEmpty ?? false) {
      rows.add(
        TableRowModel(
          title: "Production Companies",
          data: CoreFunctions.getCompanies(
              provider.currentMovie.productionCompanies),
        ),
      );
    }
    return TableModel(rows: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
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
