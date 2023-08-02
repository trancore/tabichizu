import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';
import 'package:tabichizu/data/constants/hive.dart';
import 'package:tabichizu/data/model/hive/location/location.dart';
import 'package:tabichizu/data/model/hive/user/user.dart';
import 'package:tabichizu/firebase_options.dart';
import 'package:tabichizu/ui/default_layout.dart';
import 'package:hive_flutter/hive_flutter.dart';

final logger = Logger('CustomLogger');

void main() async {
  Logger.root.onRecord.listen((record) {
    debugPrint("---");
    debugPrint('【${record.level.name}】: ${record.time}: ${record.message}');
    debugPrint("---");
  });

  await dotenv.load(fileName: ".env");

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LocationAdapter());
  await Hive.openBox<User>(userBoxName);
  await Hive.openBox<Location>(locationBoxName);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final Box<User> userBox = Hive.box(userBoxName);
    final theme = userBox.get("user")?.theme ?? const Color(0xff000000).value;

    Map<int, Color> getColorSwatch(int red, int green, int blue) {
      return {
        50: Color.fromRGBO(red, green, blue, .1),
        100: Color.fromRGBO(red, green, blue, .2),
        200: Color.fromRGBO(red, green, blue, .3),
        300: Color.fromRGBO(red, green, blue, .4),
        400: Color.fromRGBO(red, green, blue, .5),
        500: Color.fromRGBO(red, green, blue, .6),
        600: Color.fromRGBO(red, green, blue, .7),
        700: Color.fromRGBO(red, green, blue, .8),
        800: Color.fromRGBO(red, green, blue, .9),
        900: Color.fromRGBO(red, green, blue, 1),
      };
    }

    MaterialColor getMaterialColor(int color) {
      String hexColor = "0x$theme";
      int intColor = int.parse(hexColor);
      int red = (intColor >> 16) & 0xff;
      int green = (intColor >> 8) & 0xff;
      int blue = (intColor >> 0) & 0xff;
      Map<int, Color> swatch = getColorSwatch(red, green, blue);
      return MaterialColor(color, swatch);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'tabichizu',
        theme: ThemeData(
          primarySwatch: getMaterialColor(theme),
        ),
        home: const DefaultLayout());
  }
}
