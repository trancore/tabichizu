import 'package:flutter/material.dart';

class CustomCell extends StatelessWidget {
  final String? id;
  final String text;
  final double? width;
  final TextAlign textAlign;
  final Function(String? id, String value)? onTap;

  const CustomCell({
    super.key,
    required this.id,
    this.text = '',
    this.width = 128,
    this.textAlign = TextAlign.left,
    this.onTap,
  });

  static getCell(double? width, String? text, TextAlign textAlign) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      width: width,
      child: Text(
        '$text',
        style: const TextStyle(
          fontSize: 24,
        ),
        textAlign: textAlign,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: onTap != null
          ? GestureDetector(
              onTap: () => onTap!(id, text),
              child: getCell(width, text, textAlign),
            )
          : getCell(width, text, textAlign),
    );
  }
}
