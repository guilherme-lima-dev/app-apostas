import 'package:flutter/material.dart';
import 'package:ole_players_app/controllers/auth/auth_controller.dart';
import 'package:ole_players_app/views/bet/base_bet_guess.dart';
import 'package:ole_players_app/views/bet/bet_page.dart';
import 'package:ole_players_app/views/bet/user_bets_page.dart';
import 'package:ole_players_app/views/home/home.dart';
import 'package:ole_players_app/views/user/login/login_page.dart';
import 'package:ole_players_app/views/user/register_page.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff00b9e8),
            ),
            child: Image.network(
              'https://oleplayers.com/site/images/logo.png',
              fit: BoxFit.contain,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder:
                  (BuildContext context, Object obj, StackTrace? stack) {
                return Container();
              },
            ),
          ),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          if (!authController.authenticated)
            ListTile(
              title: const Text('Cadastro'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
            ),
          ListTile(
            title: const Text('Apostar'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BaseBetGuess()));
            },
          ),
          if (authController.authenticated)
            ListTile(
              title: const Text('Minhas apostas'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserBetsPage()));
              },
            ),
          if (authController.authenticated)
            ListTile(
              title: const Text('Sair'),
              onTap: () async {
                await authController.logout();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
        ],
      ),
    );
  }
}
