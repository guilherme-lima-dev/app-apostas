import 'package:flutter/material.dart';
import 'package:ole_players_app/models/matches.dart';
import 'package:ole_players_app/services/matches_service.dart';
import 'package:ole_players_app/controllers/matches/matches_state.dart';

class MatchesController extends ValueNotifier<MatchesState>{

  final MatchesService _service;
  var matches = <Matches>[];
  var reloading = 0;

  MatchesController(this._service) : super(InitialMatchesState());

  setReloading(){
    reloading++;
    if(reloading >= 6){
      reloading = 0;
    }
  }

  Future<void> fetchAllMatches(String lotteryID) async{
    value = LoadingMatchesState();
    try{
      matches = await _service.getAll(lotteryID);
      value = SuccessMatchesState(matches);
    }catch(e){
      value = ErrorMatchesState(e.toString());
    }
    notifyListeners();
    
  }
}