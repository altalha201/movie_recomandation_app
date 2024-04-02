class TableModel {
  final List<TableRowModel> rows;

  TableModel({required this.rows});
}

class TableRowModel {
  final String title;
  final String data;

  TableRowModel({required this.title, required this.data});
}
