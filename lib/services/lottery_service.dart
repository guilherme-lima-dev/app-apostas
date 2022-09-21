import 'package:ole_players_app/endpoints.dart' as endpoints;
import 'package:ole_players_app/interfaces/http_client_interface.dart';
import 'package:ole_players_app/models/lottery.dart';

class LotteryService{
  final url = "${endpoints.url}/lottery-now";
  final IHttpClient client;


  LotteryService(this.client);

  Future<Lottery> get() async{
      final body = await client.get(url);
      return Lottery.fromJson(body['data']);
  }

}