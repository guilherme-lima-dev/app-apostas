import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ole_players_app/controllers/auth/auth_controller.dart';
import 'package:ole_players_app/controllers/matches/matches_controller.dart';
import 'package:ole_players_app/controllers/matches/matches_state.dart';
import 'package:ole_players_app/httpClients/dio_client.dart';
import 'package:ole_players_app/services/matches_service.dart';
import 'package:ole_players_app/views/widgets/container_accumulated_value.dart';
import 'package:ole_players_app/views/widgets/custom_appbar.dart';
import 'package:ole_players_app/views/widgets/custom_drawer_menu.dart';
import 'package:ole_players_app/views/widgets/custom_login_fab.dart';
import 'package:ole_players_app/views/widgets/lottery_info.dart';
import 'package:provider/provider.dart';

class BetPage extends StatefulWidget {
  const BetPage({Key? key}) : super(key: key);

  @override
  State<BetPage> createState() => _BetPageState();
}

class _BetPageState extends State<BetPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var matches = context.read<MatchesController>();
      matches.setReloading();
      if(matches.matches.isEmpty || matches.reloading <= 2){
        matches.fetchAllMatches();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final matches = context.watch<MatchesController>();
    final authController = context.watch<AuthController>();
    final state = matches.value;
    late Widget child = Container();

    if (state is LoadingMatchesState) {
      child = const CircularProgressIndicator();
    }

    if (state is SuccessMatchesState) {
      child = Column(
        children: [
          for (var i = 0; i < matches.matches.length; i++)
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoTeam(
                      urlImage: matches.matches[i].teamOwner!.linkLogo ?? "",
                      abbreviationName:
                      matches.matches[i].teamOwner!.abreviation ?? ""),
                  const CustomInputBet(
                    isOwner: true,
                    actionDone: false,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "X",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const CustomInputBet(
                    isOwner: false,
                    actionDone: false,
                  ),
                  LogoTeam(
                      urlImage: matches.matches[i].teamVisitor!.linkLogo ?? "",
                      abbreviationName:
                      matches.matches[i].teamVisitor!.abreviation ?? ""),
                ],
              ),
            ),
        ],
      );
    }

    if (state is ErrorMatchesState) {
      child = const Text("Sem conexão com internet!");
    }

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const ContainerAccumulatedValue(),
            const LotteryInfo(),
            //https://logodetimes.com/times/flamengo/logo-flamengo-antigo-256.png
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .02),
              child: Center(
                child: child,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04),
              child: CustomButtonBlack(
                textContent: "GERAR PALPITE R\$1,00",
                onTap: () {
                  print("gerar palpite");
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: const CustomButtonBlack(textContent: "CERCAR PLACARES")),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    bottom: MediaQuery.of(context).size.height * (authController.authenticated ? 0.05  : 0.15)),
                child: const CustomButtonGreen(textContent: "APOSTAR")),
          ],
        ),
      ),
    );
  }


}

class CustomButtonBlack extends StatelessWidget {
  const CustomButtonBlack({Key? key, required this.textContent, this.onTap})
      : super(key: key);
  final String textContent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          textContent,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

class CustomButtonGreen extends StatelessWidget {
  const CustomButtonGreen({Key? key, required this.textContent, this.onTap})
      : super(key: key);
  final String textContent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01),
        decoration: const BoxDecoration(
            color: Color(0xffbada54),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          textContent,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 10.0),
        ),
      ),
      onTap: onTap,
    );
  }
}

class LogoTeam extends StatelessWidget {
  const LogoTeam({
    Key? key,
    required this.urlImage,
    required this.abbreviationName,
  }) : super(key: key);

  final String urlImage;
  final String abbreviationName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            urlImage,
            width: MediaQuery.of(context).size.width * .15,
          ),
          Text(
            abbreviationName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class CustomInputBet extends StatelessWidget {
  const CustomInputBet(
      {Key? key, required this.isOwner, required this.actionDone})
      : super(key: key);

  final bool isOwner;
  final bool actionDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isOwner
          ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05)
          : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * .15,
      height: MediaQuery.of(context).size.height * .050,
      child: TextFormField(
        textAlign: TextAlign.center,
        textInputAction:
            actionDone ? TextInputAction.done : TextInputAction.next,
        keyboardType: const TextInputType.numberWithOptions(decimal: false),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly,
          TextInputFormatter.withFunction(
            (oldValue, newValue) => newValue.copyWith(
              text: newValue.text.replaceAll(RegExp('[^A-Za-z0-9]'), ''),
            ),
          ),
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: InputDecoration(
          hintText: '0',
          contentPadding: const EdgeInsets.only(top: 10),
          // icon: Icon(Icons.person),
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
