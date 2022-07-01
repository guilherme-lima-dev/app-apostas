import 'package:flutter/material.dart';
import 'package:ole_players_app/home/footer_home_page.dart';
import 'package:ole_players_app/home/how_to_bet_rules.dart';
import 'package:ole_players_app/widgets/container_accumulated_value.dart';
import 'package:ole_players_app/widgets/custom_appbar.dart';
import 'package:ole_players_app/widgets/custom_drawer_menu.dart';
import 'package:ole_players_app/widgets/custom_login_fab.dart';
import 'package:ole_players_app/widgets/lottery_info.dart';
import 'package:ole_players_app/widgets/range_red_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              const RangeRed(),
              Image.network('https://oleplayers.com/site/images/banner.webp', width: MediaQuery.of(context).size.width * 1,),
              const ContainerAccumulatedValue(),
              const LotteryInfo(),
              const HowToBetRules(),
              const FooterHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}







