import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ole_players_app/services/bet_service.dart';

class BetController extends ChangeNotifier{
  List guesses = [];
  int counterNewGuesses = 0;
  bool loading = false;
  final BetService service;

  BetController(this.service);


  setLoading(){
    loading = !loading;
    notifyListeners();
  }

  addGuess(List betLine){
    guesses.add(betLine);
    counterNewGuesses++;
    notifyListeners();
  }

  resetGuesses(){
    guesses.clear();
    notifyListeners();
  }

  removeGuess(index){
    guesses.removeAt(index);
    notifyListeners();
  }

  resetCounter(){
    counterNewGuesses = 0;
    notifyListeners();
  }

  hasBets(){
    return guesses.isNotEmpty;
  }

  newBet(String token, String lotteryID, String userID) async{
    var data = mountBet(lotteryID, userID);
    var res = await service.newBet(token, jsonEncode(data));
    setLoading();
    notifyListeners();

    return res;
  }

  Map mountBet(String lotteryID, String userID){
    var betsAmount = guesses.length;
    var betsID = [];
    Map data = {};
    Map json = {};

    guesses.asMap().forEach((index, guess) {
      betsID.add(index+1);
      var matches = [];
      var teamOwners = [];
      var teamVisitors = [];
      guess.asMap().forEach((i, item) {
        matches.add(item["match"].id.toString());
        teamOwners.add(item["shotTeamOwner"].toString());
        teamVisitors.add(item["shotTeamVisitor"].toString());
      });
      data["bets_matches_${index+1}"] = matches;
      data["bets_team_owners_${index+1}"] = teamOwners;
      data["bets_team_visitors_${index+1}"] = teamVisitors;
    });
    data['bets_id'] = betsID;
    data['lottery_id'] = [lotteryID];

    json["data"] = jsonEncode(data);
    json["lottery_id"] = lotteryID.toString();
    json["betsAmount"] = betsAmount.toString();
    json["user_id"] = userID.toString();

    return json;
  }
}
