import 'package:flutter/cupertino.dart';
import 'package:ole_players_app/controllers/lottery/lottery_controller.dart';
import 'package:ole_players_app/controllers/lottery/lottery_state.dart';
import 'package:ole_players_app/views/widgets/accumulated_value.dart';
import 'package:provider/provider.dart';

class ContainerAccumulatedValue extends StatefulWidget {
  const ContainerAccumulatedValue({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerAccumulatedValue> createState() => _ContainerAccumulatedValueState();
}

class _ContainerAccumulatedValueState extends State<ContainerAccumulatedValue> {

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LotteryController>();
    final state = controller.value;
    late Widget child = Container();

    if(state is SuccessLotteryState){
      child = AccumulatedValue(valueFormatted: controller.lottery.lotteryAmmountFormatted.toString());
    }

    if(state is ErrorLotteryState){
      child = const Text("Sem conexão com internet!");
    }
    return Container(
      color: Color(0xffBADA54),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/acumulado.webp",
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Image.asset("images/personagem-3d.webp",
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
