import 'package:flutter/material.dart';
import 'package:ole_players_app/controllers/auth/auth_controller.dart';
import 'package:ole_players_app/controllers/matches/matches_controller.dart';
import 'package:ole_players_app/controllers/matches/matches_state.dart';
import 'package:ole_players_app/views/bet/bet_page.dart';
import 'package:ole_players_app/views/bet/guesses_page.dart';
import 'package:ole_players_app/views/widgets/custom_appbar.dart';
import 'package:ole_players_app/views/widgets/custom_drawer_menu.dart';
import 'package:ole_players_app/views/widgets/custom_login_fab.dart';
import 'package:provider/provider.dart';

class BaseBetGuess extends StatefulWidget {
  const BaseBetGuess({Key? key}) : super(key: key);

  @override
  _BaseBetGuessState createState() => _BaseBetGuessState();
}

class _BaseBetGuessState extends State<BaseBetGuess> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final authController = context.watch<AuthController>();

    const List<Widget> _pages = <Widget>[
        BetPage(),
        GuessesPage()
    ];

    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
      authController.authenticated ? null : const CustomLoginFAB(),
      bottomNavigationBar: authController.authenticated
          ? BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.lightBlueAccent,
        selectedFontSize: 15,
        selectedIconTheme:
        const IconThemeData(color: Colors.lightBlueAccent, size: 35),
        selectedItemColor: Colors.lightBlueAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        // unselectedIconTheme: const IconThemeData(
        //   color: Colors.grey,
        // ),
        // unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Apostar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_outlined),
            label: 'Palpites',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      )
          : null,

      body: _pages.elementAt(selectedIndex),
    );
  }
}
