import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFormTextField extends StatefulWidget {
  final String name;
  final bool hasBorder;
  final String? value;
  final double? fontSize;
  final TextAlign? textAlign;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String?)? onChanged;

  const CustomFormTextField({
    super.key,
    required this.name,
    required this.hasBorder,
    this.value,
    this.fontSize,
    this.textAlign,
    this.hintText = "",
    this.controller,
    this.onChanged,
  });

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      textAlign: widget.textAlign ?? TextAlign.left,
      style: TextStyle(fontSize: widget.fontSize ?? 24),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide:
              widget.hasBorder ? const BorderSide(width: 5) : BorderSide.none,
        ),
        hintStyle: const TextStyle(color: Colors.black26, fontSize: 24),
        hintText: widget.hintText,
      ),
      onSubmitted: widget.onChanged,
      controller: widget.controller,
    );
  }
}
