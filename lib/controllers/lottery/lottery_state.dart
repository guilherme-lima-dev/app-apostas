import 'package:ole_players_app/models/lottery.dart';

abstract class LotteryState{}

class InitialLotteryState extends LotteryState{}
class LoadingLotteryState extends LotteryState{}
class SuccessLotteryState extends LotteryState{
  final Lottery lottery;

  SuccessLotteryState(this.lottery);

}
class ErrorLotteryState extends LotteryState{
  final String message;

  ErrorLotteryState(this.message);
}