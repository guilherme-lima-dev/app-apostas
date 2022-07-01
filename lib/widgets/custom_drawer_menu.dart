import 'package:flutter/material.dart';
import 'package:ole_players_app/bet/bet_page.dart';
import 'package:ole_players_app/user/register_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff00b9e8),
            ),
            child:Image.network('https://oleplayers.com/site/images/logo.png'),
          ),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          ListTile(
            title: const Text('Cadastro'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegisterPage())
              );
            },
          ),
          ListTile(
            title: const Text('Apostar'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BetPage())
              );
            },
          )
        ],
      ),
    );
  }
}