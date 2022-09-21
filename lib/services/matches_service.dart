import 'package:ole_players_app/endpoints.dart' as endpoints;
import 'package:ole_players_app/interfaces/http_client_interface.dart';
import 'package:ole_players_app/models/matches.dart';

class MatchesService{
  final url = "${endpoints.url}/matches/";
  final IHttpClient client;


  MatchesService(this.client);

  Future<List<Matches>> getAll(String lotteryID) async{
      final body = await client.get(url+lotteryID);
      return body.map<Matches>(Matches.fromJson).toList();
  }

}