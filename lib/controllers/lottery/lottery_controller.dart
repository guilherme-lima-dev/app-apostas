import 'package:flutter/cupertino.dart';
import 'package:ole_players_app/controllers/lottery/lottery_state.dart';
import 'package:ole_players_app/services/lottery_service.dart';

import '../../models/lottery.dart';

class LotteryController extends ValueNotifier<LotteryState>{

  final LotteryService lotteryService;
  var lottery = Lottery();

  LotteryController(this.lotteryService) : super(InitialLotteryState());

  Future<void> fetchLotteryNow() async{
    value = LoadingLotteryState();
    try{
      lottery = await lotteryService.get();
      value = SuccessLotteryState(lottery);
    }catch(e){
      value = ErrorLotteryState(e.toString());
    }
    notifyListeners();

  }
}