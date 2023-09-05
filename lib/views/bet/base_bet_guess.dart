import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ole_players_app/controllers/auth/auth_controller.dart';
import 'package:ole_players_app/controllers/bet/bet_controller.dart';
import 'package:ole_players_app/controllers/lottery/lottery_controller.dart';
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
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String msg, Color color, IconData icon) {
    Widget toast = Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.08),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            msg,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    final betController = context.watch<BetController>();
    final lotteryController = context.watch<LotteryController>();

    const List<Widget> pages = <Widget>[BetPage(), GuessesPage()];

    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !authController.authenticated
          ? const CustomLoginFAB()
          : betController.guesses.isEmpty || selectedIndex != 1
              ? null
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FloatingActionButton.extended(
                          label: Row(
                            children: const [
                              Text(
                                'LIMPAR ',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Icon(Icons.close_rounded)
                            ],
                          ),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          highlightElevation: 50,
                          elevation: 10,
                          onPressed: () {
                            betController.resetGuesses();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FloatingActionButton.extended(
                          label: Row(
                            children: const [
                              Text(
                                'APOSTAR ',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Icon(Icons.monetization_on)
                            ],
                          ),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          highlightElevation: 50,
                          elevation: 10,
                          onPressed: () async {
                            betController.setLoading();
                            var res = await betController.newBet(
                                authController.token,
                                lotteryController.lottery.id.toString(),
                                authController.user.id.toString()
                            );
                            betController.resetGuesses();
                            _showToast("Aposta registrada com sucesso!",
                                Colors.green, Icons.check);
                          },
                        ),
                      ),
                    ]),
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
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.sports_soccer),
                  label: 'Apostar',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    children: <Widget>[
                      const Icon(Icons.table_chart_outlined),
                      if (betController.counterNewGuesses > 0)
                        Positioned(
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              "${betController.counterNewGuesses}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                    ],
                  ),
                  label: 'Palpites',
                ),
              ],
              currentIndex: selectedIndex,
              onTap: _onItemTapped,
            )
          : null,
      body: pages.elementAt(selectedIndex),
    );
  }
}
