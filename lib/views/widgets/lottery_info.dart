import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LotteryInfo extends StatelessWidget {
  const LotteryInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0d6efd),
      width: MediaQuery.of(context).size.width * 100,
      height: MediaQuery.of(context).size.height * 0.05,
      child: const FittedBox(
        fit: BoxFit.scaleDown,
        child: Center(
          child: Text("RODADA: 2644 - INICIO: QUARTA-FEIRA, 15/06 17:06 - TÉRMINO: SÁBADO, 18/06 23:06",
            style: TextStyle(
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
