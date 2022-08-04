import 'package:flutter/cupertino.dart';
import 'package:ole_players_app/views/widgets/accumulated_value.dart';

class ContainerAccumulatedValue extends StatelessWidget {
  const ContainerAccumulatedValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          AccumulatedValue(valueFormatted: "3.000.000,00"),
        ],
      ),
    );
  }
}