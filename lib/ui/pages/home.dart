import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tabichizu/data/constants/hive.dart';
import 'package:tabichizu/data/model/hive/location/location.dart';
import 'package:tabichizu/ui/svg_map.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<Location> locationBox;

  @override
  Widget build(BuildContext context) {
    locationBox = Hive.box(locationBoxName);

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: locationBox.listenable(),
        builder: (context, box, _) {
          return const SVGMap();
        },
      ),
    );
  }
}
