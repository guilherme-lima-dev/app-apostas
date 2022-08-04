import 'package:flutter/material.dart';
import 'package:ole_players_app/views/bet/bet_page.dart';

class HowToBetRules extends StatelessWidget {
  const HowToBetRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        color: const Color(0xff00B9E8),
        height: MediaQuery.of(context).size.height * 0.80,
        width: MediaQuery.of(context).size.width * 1,
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            const Text("Como apostar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Text("A OlePlayers disponibiliza cinco partidas de futebol a cada rodada. Insira o placar conforme sua intuição. O conjunto dos cinco placares criará um palpite. Será (ão) premiado(s) o(s) palpite(s) com maior(es) pontuação(ões) na linha horizontal.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Text("Tabela de pontos",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleRules(points: "5", result: "PLACAR"),
                CircleRules(points: "3", result: "VITÓRIA"),
                CircleRules(points: "3", result: "EMPATE"),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width * 0.45),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                            color: const Color(0xff046A95),
                            border: Border.all(
                                      color: const Color(0xff046A95),
                                      width: .5,
                                      style: BorderStyle.solid,
                                    ),
                        ),
                        children: [
                          customTableCell("Pontos",
                            color: Colors.white
                          ),
                          customTableCell("Premiação",
                            color: Colors.white
                          ),
                        ]
                      ),
                      TableRow(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          children: [
                            customTableCell("25 pontos"),
                            customTableCell("100% da premiação"),
                          ]
                      ),
                      TableRow(
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          children: [
                            customTableCell("Abaixo de 25"),
                            customTableCell("50% da premiação"),
                          ]
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Color(0xff046A95),
                    ),
                    child: const Center(
                      child: Text("Prêmiado(s) abaixo de 25 pontos, o residual em percentual da premiação se acumula para a próxima rodada",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff6CB500)),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.green.withOpacity(0.04);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.green.withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),

                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const BetPage())
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: const Text("QUERO APOSTAR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CircleRules extends StatelessWidget {
  const CircleRules({Key? key, required this.points, required this.result}) : super(key: key);
  final String points;
  final String result;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.125,
      width: MediaQuery.of(context).size.width * 0.33,
      margin: const EdgeInsets.only( top: 35),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("acertou",
            style: TextStyle(
              color: Color(0xff3A7900),
              fontSize: 12,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: Text(result,
              style: const TextStyle(
                color: Color(0xff046A95),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Text("$points pontos",
            style: const TextStyle(
              color: Color(0xff046A95),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

Widget customTableCell(String text, {Color? color = Colors.black}) {
  return SizedBox(
    height: 25,
    child: Align(
      alignment: Alignment.center,
      child: Text(text,
        style: TextStyle(
          color: color
        ),
      ),
    ),
  );
}

