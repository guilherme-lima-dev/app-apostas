import 'package:flutter/material.dart';

class RangeRed extends StatelessWidget {
  const RangeRed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(220,53,69, 1),
      ),
      height: 40,
      width: MediaQuery.of(context).size.width * 1,
      child: const Center(
        child: Text('ACERTE OS PLACARES E GANHE O PRÊMIO',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}