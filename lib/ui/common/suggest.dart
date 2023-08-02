import 'package:flutter/material.dart';
import 'package:tabichizu/ui/common/table/custom_cell.dart';
import 'package:tabichizu/ui/common/table/custom_table.dart';

class SuggestData {
  final String? placeId;
  final String description;

  const SuggestData({
    this.placeId,
    required this.description,
  });
}

class Suggest extends StatelessWidget {
  final List<SuggestData> suggestList;
  final Function(String? id, String value) onTap;

  const Suggest({super.key, required this.suggestList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomTable(
        children: suggestList
            .map(
              (suggest) => TableRow(
                children: [
                  CustomCell(
                    id: suggest.placeId,
                    text: suggest.description,
                    textAlign: TextAlign.left,
                    onTap: onTap,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
