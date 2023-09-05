import 'package:flutter/material.dart';
import 'package:ole_players_app/controllers/auth/auth_controller.dart';
import 'package:ole_players_app/controllers/bet/bet_controller.dart';
import 'package:ole_players_app/controllers/bet/user_bets_controller.dart';
import 'package:ole_players_app/controllers/lottery/lottery_controller.dart';
import 'package:ole_players_app/controllers/matches/matches_controller.dart';
import 'package:ole_players_app/httpClients/dio_client.dart';
import 'package:ole_players_app/interfaces/http_client_interface.dart';
import 'package:ole_players_app/services/auth_service.dart';
import 'package:ole_players_app/services/bet_service.dart';
import 'package:ole_players_app/services/lottery_service.dart';
import 'package:ole_players_app/services/matches_service.dart';
import 'package:ole_players_app/views/home/home.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const SplashscreenHome());
}

class SplashscreenHome extends StatelessWidget {
  const SplashscreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: SplashScreen(
            seconds: 5,
            navigateAfterSeconds: const MyApp(),
            title: const Text(
              'Já fez seu olé hoje?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            image: Image.asset(
              'images/logo-ole.png',
              fit: BoxFit.fitWidth,
            ),
            backgroundColor: const Color(0xff00b9e8),
            // styleTextUnderTheLoader:,
            photoSize: 100.0,
            loaderColor: Colors.white),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IHttpClient>(create: (_) => DioClient()),
        Provider<MatchesService>(create: (context) => MatchesService(context.read())),
        Provider<LotteryService>(create: (context) => LotteryService(context.read())),
        Provider<AuthService>(create: (context) => AuthService(context.read())),
        Provider<BetService>(create: (context) => BetService(context.read())),
        ChangeNotifierProvider<MatchesController>(create: (context) => MatchesController(context.read())),
        ChangeNotifierProvider<LotteryController>(create: (context) => LotteryController(context.read())),
        ChangeNotifierProvider<AuthController>(create: (context) => AuthController(context.read())),
        ChangeNotifierProvider<BetController>(create: (context) => BetController(context.read())),
        ChangeNotifierProvider<UserBetsController>(create: (context) => UserBetsController(context.read())),
      ],
      child: MaterialApp(
        title: 'OlePlayers',
        theme: ThemeData(
          primarySwatch: buildMaterialColor(const Color(0xff00b9e8)),
        ),
        home: const HomePage(),
      ),
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
