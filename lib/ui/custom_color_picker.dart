import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomColorPicker extends StatefulWidget {
  final BuildContext context;
  final int theme;
  final Function(Color color) changeColor;

  const CustomColorPicker({
    super.key,
    required this.context,
    required this.theme,
    required this.changeColor,
  });

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker>
    with SingleTickerProviderStateMixin {
  late Color pickedColor;
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
      reverseCurve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('好きな色を選んでください'),
      content: SingleChildScrollView(
        child: BlockPicker(
            pickerColor: Color(widget.theme),
            onColorChanged: (color) {
              pickedColor = color;
            }),
      ),
      actions: [
        ElevatedButton(
          child: const Text('決定'),
          onPressed: () {
            widget.changeColor(pickedColor);
            // color_pickerを閉じる
            Navigator.of(widget.context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('変更したテーマは次回起動時に適用されます'),
                duration: const Duration(milliseconds: 1500),
                animation: animation,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
