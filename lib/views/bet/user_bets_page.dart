import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ole_players_app/controllers/auth/auth_controller.dart';
import 'package:ole_players_app/controllers/bet/bet_controller.dart';
import 'package:ole_players_app/controllers/bet/user_bets_controller.dart';
import 'package:ole_players_app/controllers/lottery/lottery_controller.dart';
import 'package:ole_players_app/views/widgets/custom_appbar.dart';
import 'package:ole_players_app/views/widgets/custom_drawer_menu.dart';
import 'package:provider/provider.dart';

class UserBetsPage extends StatefulWidget {
  const UserBetsPage({Key? key}) : super(key: key);

  @override
  _UserBetsPageState createState() => _UserBetsPageState();
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(isExpanded: index == 0 ? true : false);
  });
}

class _UserBetsPageState extends State<UserBetsPage> {
  late List<Item> _data = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var lotteryController = context.read<LotteryController>();
      var authController = context.read<AuthController>();
      var userBetsController = context.read<UserBetsController>();

      userBetsController.setLoading();

      await userBetsController.getAllBets(
          authController.token, lotteryController.lottery.id.toString());
      _data = generateItems(userBetsController.bets.length);

      userBetsController.setLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final lotteryController = context.watch<LotteryController>();
    final authController = context.watch<AuthController>();
    final userBetsController = context.watch<UserBetsController>();
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10.0),
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
                            "Rodada: ${userBetsController.bets[index].lottery?.lotteryRandomId}, Conjunto de aposta: ${userBetsController.bets[index].bettingSetId} ",
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
                              if (userBetsController
                                  .bets[index].betLines!.isNotEmpty)
                                for (var i = 0; i < 5; i++)
                                  DataRow(cells: [
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            "${userBetsController.bets[index].betLines![i].matches!.teamOwner!.linkLogo}",
                                            width: 0.1 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          Text(
                                            "${userBetsController.bets[index].betLines![i].shotTeamOwner}",
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
                                            "${userBetsController.bets[index].betLines![i].shotTeamVisitor}",
                                            style: TextStyle(
                                              fontSize: 22,
                                            ),
                                          ),
                                          Image.network(
                                            "${userBetsController.bets[index].betLines![i].matches!.teamVisitor!.linkLogo}",
                                            width: 0.1 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                        ],
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
              );
            },
          ),
        ),
        // if (userBetsController.loading)
        //   const Opacity(
        //     opacity: 0.8,
        //     child: ModalBarrier(dismissible: false, color: Colors.black),
        //   ),
        if (userBetsController.loading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ]),
    );
  }
}

class Item {
  Item({
    this.isExpanded = false,
  });

  bool isExpanded;
}
