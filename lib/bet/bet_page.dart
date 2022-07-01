import 'package:flutter/material.dart';
import 'package:ole_players_app/widgets/custom_appbar.dart';
import 'package:ole_players_app/widgets/custom_drawer_menu.dart';
import 'package:ole_players_app/widgets/custom_login_fab.dart';

class BetPage extends StatelessWidget {
  const BetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomLoginFAB(),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 1000,
                        color: Colors.yellowAccent,
                      )
                    ]
                )
            )
        )
    );
  }
}
