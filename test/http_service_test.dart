import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ole_players_app/httpClients/dio_client.dart';
import 'package:ole_players_app/interfaces/http_client_interface.dart';
import 'package:ole_players_app/models/user.dart';
import 'package:ole_players_app/services/matches_service.dart';
import 'mocks.dart';
import 'package:ole_players_app/endpoints.dart' as endpoints;

void main() {
  final client = IHttpClientMock();
  test('deve retornar todas as matches', () async {
    when(() => client.get(any())).thenAnswer((_) async => jsonDecode(jsonResponse));

    final service = MatchesService(client);
    final modelList = await service.getAll("1");
    expect(modelList[0].teamOwner?.name, "Boca");
  });

  test('deve retornar o token de login', () async {
    final client = DioClient();
    try{
      final result = await client.post("${endpoints.url}/auth/login", {'username': 'guigui', 'password': 'guilherme20'});

      final token = result['data']['token'];
      if(token != null) {
        final user = await client.get("${endpoints.url}/user", token);

        print(User.fromJson(user));
      }
      expect("".runtimeType, token.runtimeType);
    }catch(e){
      print("login invalido!");
    }
  });
}

const jsonResponse = r''' 
[
    {
        "id": 1,
        "date_match": "2023-01-01T03:00:00.000000Z",
        "team_owner": {
            "id": 1,
            "name": "Boca",
            "logo": "logo/1702292022060862a100553e79f.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:02:29.000000Z",
            "updated_at": "2022-06-08T20:02:29.000000Z",
            "abreviation": "CBJ",
            "link_logo": "http://olefut.test/storage/logo/1702292022060862a100553e79f.png"
        },
        "team_visitor": {
            "id": 2,
            "name": "Atletico Goianiense",
            "logo": "logo/1702492022060862a100699aed5.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:02:49.000000Z",
            "updated_at": "2022-06-08T20:02:49.000000Z",
            "abreviation": "ACG",
            "link_logo": "http://olefut.test/storage/logo/1702492022060862a100699aed5.png"
        },
        "final_result_owner": 2,
        "final_result_visitor": 3,
        "finished": 1,
        "deleted": 0,
        "deleted_at": null,
        "created_at": "2022-06-08T20:04:24.000000Z",
        "updated_at": "2022-06-15T19:41:50.000000Z",
        "local_match": "Estádio",
        "local_transmission": "Sport TV",
        "date_match_formatted": "DOMINGO, 01/01 00:00",
        "pivot": {
            "lottery_id": 1,
            "matches_id": 1
        }
    },
    {
        "id": 5,
        "date_match": "2022-12-01T01:59:00.000000Z",
        "team_owner": {
            "id": 1,
            "name": "Boca",
            "logo": "logo/1702292022060862a100553e79f.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:02:29.000000Z",
            "updated_at": "2022-06-08T20:02:29.000000Z",
            "abreviation": "CBJ",
            "link_logo": "http://olefut.test/storage/logo/1702292022060862a100553e79f.png"
        },
        "team_visitor": {
            "id": 4,
            "name": "Melhor time do mundo",
            "logo": "logo/1703162022060862a10084e53de.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:03:17.000000Z",
            "updated_at": "2022-06-08T20:03:17.000000Z",
            "abreviation": "FLA",
            "link_logo": "http://olefut.test/storage/logo/1703162022060862a10084e53de.png"
        },
        "final_result_owner": 1,
        "final_result_visitor": 2,
        "finished": 1,
        "deleted": 0,
        "deleted_at": null,
        "created_at": "2022-06-08T20:06:03.000000Z",
        "updated_at": "2022-06-15T19:41:50.000000Z",
        "local_match": "Engenhão",
        "local_transmission": "Sport TV",
        "date_match_formatted": "QUARTA-FEIRA, 30/11 22:59",
        "pivot": {
            "lottery_id": 1,
            "matches_id": 5
        }
    },
    {
        "id": 3,
        "date_match": "2023-01-01T02:59:00.000000Z",
        "team_owner": {
            "id": 3,
            "name": "Juventude",
            "logo": "logo/1703042022060862a100780bc36.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:03:04.000000Z",
            "updated_at": "2022-06-08T20:03:04.000000Z",
            "abreviation": "JUV",
            "link_logo": "http://olefut.test/storage/logo/1703042022060862a100780bc36.png"
        },
        "team_visitor": {
            "id": 2,
            "name": "Atletico Goianiense",
            "logo": "logo/1702492022060862a100699aed5.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:02:49.000000Z",
            "updated_at": "2022-06-08T20:02:49.000000Z",
            "abreviation": "ACG",
            "link_logo": "http://olefut.test/storage/logo/1702492022060862a100699aed5.png"
        },
        "final_result_owner": 2,
        "final_result_visitor": 2,
        "finished": 1,
        "deleted": 0,
        "deleted_at": null,
        "created_at": "2022-06-08T20:05:20.000000Z",
        "updated_at": "2022-06-15T19:41:50.000000Z",
        "local_match": "Estádio",
        "local_transmission": "Sport TV",
        "date_match_formatted": "SÁBADO, 31/12 23:59",
        "pivot": {
            "lottery_id": 1,
            "matches_id": 3
        }
    },
    {
        "id": 4,
        "date_match": "2022-01-01T02:59:00.000000Z",
        "team_owner": {
            "id": 3,
            "name": "Juventude",
            "logo": "logo/1703042022060862a100780bc36.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:03:04.000000Z",
            "updated_at": "2022-06-08T20:03:04.000000Z",
            "abreviation": "JUV",
            "link_logo": "http://olefut.test/storage/logo/1703042022060862a100780bc36.png"
        },
        "team_visitor": {
            "id": 2,
            "name": "Atletico Goianiense",
            "logo": "logo/1702492022060862a100699aed5.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:02:49.000000Z",
            "updated_at": "2022-06-08T20:02:49.000000Z",
            "abreviation": "ACG",
            "link_logo": "http://olefut.test/storage/logo/1702492022060862a100699aed5.png"
        },
        "final_result_owner": 1,
        "final_result_visitor": 2,
        "finished": 1,
        "deleted": 0,
        "deleted_at": null,
        "created_at": "2022-06-08T20:05:41.000000Z",
        "updated_at": "2022-06-15T19:41:50.000000Z",
        "local_match": "Estádio",
        "local_transmission": "Sport TV",
        "date_match_formatted": "SEXTA-FEIRA, 31/12 23:59",
        "pivot": {
            "lottery_id": 1,
            "matches_id": 4
        }
    },
    {
        "id": 2,
        "date_match": "2023-01-01T02:59:00.000000Z",
        "team_owner": {
            "id": 4,
            "name": "Melhor time do mundo",
            "logo": "logo/1703162022060862a10084e53de.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:03:17.000000Z",
            "updated_at": "2022-06-08T20:03:17.000000Z",
            "abreviation": "FLA",
            "link_logo": "http://olefut.test/storage/logo/1703162022060862a10084e53de.png"
        },
        "team_visitor": {
            "id": 5,
            "name": "Seleção Brasileira",
            "logo": "logo/1703372022060862a1009966dda.png",
            "deleted": 0,
            "deleted_at": null,
            "created_at": "2022-06-08T20:03:37.000000Z",
            "updated_at": "2022-06-08T20:03:37.000000Z",
            "abreviation": "BRA",
            "link_logo": "http://olefut.test/storage/logo/1703372022060862a1009966dda.png"
        },
        "final_result_owner": 2,
        "final_result_visitor": 2,
        "finished": 1,
        "deleted": 0,
        "deleted_at": null,
        "created_at": "2022-06-08T20:04:45.000000Z",
        "updated_at": "2022-06-15T19:41:50.000000Z",
        "local_match": "Estádio",
        "local_transmission": "Sport TV",
        "date_match_formatted": "SÁBADO, 31/12 23:59",
        "pivot": {
            "lottery_id": 1,
            "matches_id": 2
        }
    }
]
''';
