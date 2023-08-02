import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:tabichizu/data/constants/hive.dart';
import 'package:tabichizu/data/constants/prefecture.dart';
import 'package:tabichizu/data/model/hive/location/location.dart';
import 'package:xml/xml.dart';

class SVGMap extends StatefulWidget {
  const SVGMap({super.key});

  @override
  SVGMapState createState() => SVGMapState();
}

/// SVGMapの描画（日本地図の描画）
class SVGMapState extends State<SVGMap> {
  late Box<Location> locationBox;
  late Future<List<MapShape>> _shapes;
  ValueNotifier<Offset> notifier = ValueNotifier(Offset.zero);

  void touchPrefecture(Offset localPosition) {
    setState(() {
      notifier.value = localPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    _shapes = Future(
      () async {
        List<MapShape> shapes = [];

        rootBundle.load('assets/images/Japan_template_large.svg').then(
          (ByteData data) {
            final document =
                XmlDocument.parse(utf8.decode(data.buffer.asUint8List()));
            final svgRoot = document.findAllElements('svg').first;
            final strokeRoot = svgRoot.findElements('g').first;
            final prefectures = strokeRoot.children;
            final visitedPrefecture = locationBox.values.map(
              (location) {
                return location.prefecture;
              },
            ).toList();

            for (var node in prefectures) {
              final id = node.getAttribute('id'); // ex: hokkaido
              if (id != null) {
                final paths = node.findAllElements('path');
                for (var element in paths) {
                  final data = element.getAttribute('d');
                  final printName = prefectureName[prefectureId[id]];

                  shapes.add(
                    MapShape(
                        data,
                        printName!,
                        visitedPrefecture
                                .contains(prefectureName[prefectureId[id]])
                            ? Theme.of(context).primaryColor
                            : Colors.white),
                  );
                }
              }
            }
          },
        );
        return shapes;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    locationBox = Hive.box(locationBoxName);

    return FutureBuilder(
      future: _shapes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Listener(
            onPointerDown: (e) => touchPrefecture(e.localPosition),
            onPointerMove: (e) => touchPrefecture(e.localPosition),
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(0),
              minScale: 1.0,
              maxScale: 2.0,
              child: CustomPaint(
                painter: SVGMapPainter(context, notifier, snapshot.data),
                child: const SizedBox.expand(),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class MapShape {
  Path? _transformedPath;

  final Path _path;
  final String _label;
  final Color _color;

  MapShape(strPath, this._label, this._color)
      : _path = parseSvgPathData(strPath);

  void transform(Matrix4 matrix) =>
      _transformedPath = _path.transform(matrix.storage);
}

class SVGMapPainter extends CustomPainter {
  Size _size = Size.zero;

  final BuildContext _context;
  final List<MapShape>? _shapes;
  final ValueNotifier<Offset> _notifier;
  final Paint _paint = Paint();

  SVGMapPainter(this._context, this._notifier, this._shapes)
      : super(repaint: _notifier);

  @override
  void paint(Canvas canvas, Size size) {
    if (size != _size) {
      _size = size;
      final fs = applyBoxFit(BoxFit.contain, const Size(1400, 1600), size);
      final r = Alignment.center.inscribe(fs.destination, Offset.zero & size);
      final matrix = Matrix4.translationValues(r.left, r.top, 0)
        ..scale(fs.destination.width / fs.source.width);
      if (_shapes != null) {
        for (var shape in _shapes!) {
          shape.transform(matrix);
        }
      }
    }

    canvas
      ..clipRect(Offset.zero & size)
      ..drawColor(Colors.blue.shade300, BlendMode.src);

    dynamic selectedMapShape;

    if (_shapes != null) {
      for (var shape in _shapes!) {
        final path = shape._transformedPath;
        final selected = path!.contains(_notifier.value);
        _paint
          ..color = selected ? Theme.of(_context).primaryColor : shape._color
          ..style = PaintingStyle.fill;
        canvas.drawPath(path, _paint);
        selectedMapShape ??= selected ? shape : null;

        _paint
          ..color = Colors.black
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke;
        canvas.drawPath(path, _paint);
      }
    }

    if (selectedMapShape != null) {
      _paint
        ..color = Colors.black
        ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 12)
        ..style = PaintingStyle.fill;
      canvas.drawPath(selectedMapShape._transformedPath, _paint);
      _paint.maskFilter = null;

      final builder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          fontSize: 20,
          fontFamily: 'Roboto',
        ),
      )
        ..pushStyle(ui.TextStyle(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1
            ..color = Colors.black,
        ))
        ..addText(selectedMapShape._label);
      final paragraph = builder.build()
        ..layout(ui.ParagraphConstraints(width: size.width));
      canvas.drawParagraph(paragraph, _notifier.value.translate(0, -32));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
