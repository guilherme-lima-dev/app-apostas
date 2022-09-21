import 'package:flutter/material.dart';
import 'package:ole_players_app/controllers/auth/auth_controller.dart';
import 'package:ole_players_app/controllers/lottery/lottery_controller.dart';
import 'package:ole_players_app/views/home/footer_home_page.dart';
import 'package:ole_players_app/views/home/how_to_bet_rules.dart';
import 'package:ole_players_app/views/widgets/container_accumulated_value.dart';
import 'package:ole_players_app/views/widgets/custom_appbar.dart';
import 'package:ole_players_app/views/widgets/custom_drawer_menu.dart';
import 'package:ole_players_app/views/widgets/custom_login_fab.dart';
import 'package:ole_players_app/views/widgets/lottery_info.dart';
import 'package:ole_players_app/views/widgets/range_red_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LotteryController>().fetchLotteryNow();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: authController.authenticated ? null : const CustomLoginFAB(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const RangeRed(),
              Image.asset('images/banner.webp', width: MediaQuery.of(context).size.width * 1,),
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







