import 'package:ole_players_app/interfaces/http_client_interface.dart';
import 'package:ole_players_app/endpoints.dart' as endpoints;

class BetService{
  final IHttpClient client;

  BetService(this.client);

  final urlNewBet = "${endpoints.url}/bet";

  Future newBet(String token, dynamic data) async{
    try{
      final body = await client.post(urlNewBet, data, token);
      return body;
    }catch(e){
      print(e);
      return null;
    }
  }
}