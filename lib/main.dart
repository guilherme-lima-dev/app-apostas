import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ole_players_app/home/footer_home_page.dart';
import 'package:ole_players_app/home/home.dart';
import 'package:ole_players_app/home/how_to_bet_rules.dart';
import 'package:ole_players_app/widgets/accumulated_value.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OlePlayers',
      theme: ThemeData(
        primarySwatch: buildMaterialColor(Color(0xff00b9e8)),
      ),
      home: const HomePage(),
    );
  }
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
