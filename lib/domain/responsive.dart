import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  static const _largeBreakPoint = 1200;
  static const _smallBreakPoint = 800;

  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const Responsive({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < _smallBreakPoint;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > _largeBreakPoint;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= _smallBreakPoint &&
        MediaQuery.of(context).size.width <= _largeBreakPoint;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > _largeBreakPoint) {
          return largeScreen;
        } else if (constraints.maxWidth <= _largeBreakPoint &&
            constraints.maxWidth >= _smallBreakPoint) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
