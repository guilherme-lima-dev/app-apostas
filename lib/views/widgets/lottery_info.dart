import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ole_players_app/controllers/lottery/lottery_controller.dart';
import 'package:ole_players_app/controllers/lottery/lottery_state.dart';
import 'package:provider/provider.dart';

class LotteryInfo extends StatelessWidget {
  const LotteryInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LotteryController>();
    final state = controller.value;
    late String lotteryRandom = "";
    late String start = "";
    late String end = "";
    late String lotteryInfo = "RODADA: $lotteryRandom - INICIO: $start - TÉRMINO: $end";

    if(state is SuccessLotteryState){
      lotteryRandom = controller.lottery.lotteryRandomId.toString();
      start = controller.lottery.dateStartFormatted.toString();
      end = controller.lottery.dateEndFormatted.toString();
    }
    if(state is ErrorLotteryState){
      lotteryInfo = "Sem conexão com a internet!";
    }
    return Container(
      color: Color(0xff0d6efd),
      width: MediaQuery.of(context).size.width * 100,
      height: MediaQuery.of(context).size.height * 0.05,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Center(
          child: Text(lotteryInfo,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 9.5,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
