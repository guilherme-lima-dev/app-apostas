import 'package:flutter/material.dart';
import 'package:ole_players_app/controllers/bet/bet_controller.dart';
import 'package:ole_players_app/controllers/lottery/lottery_controller.dart';
import 'package:provider/provider.dart';

class GuessesPage extends StatefulWidget {
  const GuessesPage({Key? key}) : super(key: key);

  @override
  _GuessesPageState createState() => _GuessesPageState();
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
        index: index,
        headerValue: 'Palpite ${index + 1}',
        expandedValue: 'This is item number $index',
        isExpanded: index == 0 ? true : false);
  });
}

class _GuessesPageState extends State<GuessesPage> {
  late List<Item> _data = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var betController = context.read<BetController>();
      betController.resetCounter();
      _data = generateItems(betController.guesses.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final betController = context.watch<BetController>();

    return betController.hasBets()
        ? Stack(children: [
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1),
              child: _buildPanel(betController),
            ),
            if (betController.loading)
              const Opacity(
                opacity: 0.8,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              ),
            if (betController.loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ])
        : const Center(
            child: Text("Você não possui palpites para enviar!"),
          );
  }

  Widget _buildPanel(BetController betController) {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Dismissible(
            key: Key(_data[index].headerValue),
            background: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment(-0.9, 0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${_data[index].headerValue} foi removido!",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
              setState(() {
                _data.removeAt(index);
              });
              betController.removeGuess(index);
            },
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 500),
              dividerColor: Colors.red,
              expandedHeaderPadding: const EdgeInsets.only(bottom: 0.0),
              elevation: 1,
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        _data[index].headerValue,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                  body: SizedBox(
                    width: 0.9 * MediaQuery.of(context).size.width,
                    child: Center(
                      child: DataTable(
                        columns: const [
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Palpites ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          // DataColumn(
                          //     label: Text(
                          //   'Palpite',
                          //   style: TextStyle(
                          //       fontSize: 18, fontWeight: FontWeight.bold),
                          //   // textAlign: TextAlign.center,
                          // )),
                        ],
                        rows: [
                          for (var i = 0; i < 5; i++)
                            DataRow(cells: [
                              DataCell(
                                Row(
                                  children: [
                                    Image.network(
                                      betController.guesses[index][i]['match']
                                          .teamOwner!.linkLogo,
                                      width: 0.1 *
                                          MediaQuery.of(context).size.width,
                                    ),
                                    Text(
                                      ' ${betController.guesses[index][i]['shotTeamOwner']} ',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                    const Text(
                                      "X",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' ${betController.guesses[index][i]['shotTeamVisitor']} ',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                    Image.network(
                                      betController.guesses[index][i]['match']
                                          .teamVisitor!.linkLogo,
                                      width: 0.1 *
                                          MediaQuery.of(context).size.width,
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ),
                              // DataCell(Text(
                              //   "",
                              //   textAlign: TextAlign.center,
                              //   style: const TextStyle(fontSize: 20),
                              // )),
                            ]),
                        ],
                      ),
                    ),
                  ),
                  isExpanded: _data[index].isExpanded,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  _data[index].isExpanded = !_data[index].isExpanded;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.index,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  int index;
}
