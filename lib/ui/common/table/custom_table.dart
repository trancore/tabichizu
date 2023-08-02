import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<TableRow> children;

  const CustomTable({super.key, required this.children});

  static const borderStyle = BorderSide(color: Colors.black26, width: 1.0);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        top: borderStyle,
        bottom: borderStyle,
        horizontalInside: borderStyle,
      ),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: children,
    );
  }
}
