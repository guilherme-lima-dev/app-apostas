import 'package:ole_players_app/interfaces/http_client_interface.dart';
import 'package:ole_players_app/endpoints.dart' as endpoints;

class BetService{
  final IHttpClient client;

  BetService(this.client);

  final urlNewBet = "${endpoints.url}/bet";
  late String urlBets = "${endpoints.url}/user-bets-all/";
  // final urlMixer = "${endpoints.url}/mixer-bets";
  //
  // Future mixer(String token, dynamic data)async{
  //   try{
  //     final body = await client.post(urlMixer, data, token);
  //     return body;
  //   }catch(e){
  //     print(e);
  //     return null;
  //   }
  // }

  Future newBet(String token, dynamic data) async{
    try{
      final body = await client.post(urlNewBet, data, token);
      return body;
    }catch(e){
      print(e);
      return null;
    }
  }

  Future allBets(String token, String lotteryID) async{
    try{
      urlBets = urlBets+lotteryID;
      final body = await client.get(urlBets, token);
      return body;
    }catch(e){
      print(e);
      return null;
    }
  }


}