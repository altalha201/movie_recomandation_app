import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../../utils/exports.dart';

class AppTable extends StatelessWidget {
  const AppTable({
    super.key,
    required this.table,
  });

  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        textDirection: TextDirection.ltr,
        border: TableBorder.all(
          color: Colors.grey.shade600,
        ),
        children: table.rows
            .map(
              (e) => appTableRow(e.title, e.data),
            )
            .toList(),
      ),
    );
  }

  TableRow appTableRow(String title, String data) {
    return TableRow(
      children: [
        AppTitleCell(title),
        AppDataCell(data),
      ],
    );
  }
}
