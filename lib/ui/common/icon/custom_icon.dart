import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const CustomIcon({super.key, required this.icon, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
    );
  }
}
