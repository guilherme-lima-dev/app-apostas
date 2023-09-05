import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ole_players_app/models/bet.dart';
import 'package:ole_players_app/services/bet_service.dart';

class UserBetsController extends ChangeNotifier {
  final BetService service;
  List<Bet> bets = [];
  bool loading = false;
  late var res;

  UserBetsController(this.service);

  setLoading(){
    loading = !loading;
    notifyListeners();
  }

  getAllBets(String token, String lotteryID) async {
    try {
      var res = await service.allBets(token, lotteryID);

      // print(res);
      // print(!res['data'].isEmpty);
      // if (!res['data'].isEmpty) {
      //   this.res = res;
      // }
      if (res['data'].isEmpty) {
        return {"message": "Não encontramos apostas registradas!"};
      }

      res['data'].forEach((data) {
        bets.add(Bet.fromJson(data));
      });
      notifyListeners();
      return {"message": "Apostas encontradas!"};
    } catch (e) {
      print(e);
      notifyListeners();
      return {"message": "Ocorreu um erro ao trazer as apostas!"};
    }
  }
}
