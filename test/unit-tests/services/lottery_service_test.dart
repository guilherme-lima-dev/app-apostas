import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ole_players_app/models/lottery.dart';
import 'package:ole_players_app/services/lottery_service.dart';
import '../../mocks.dart';

void main() {
  test('deve retornar um objeto do tipo lottery', () async{
    final client = IHttpClientMock();
    when(() => client.get(any())).thenAnswer((_) async => jsonDecode(jsonResponse));
    final service = LotteryService(client);
    final Lottery lottery = await service.get();
    final Lottery lotteryComparation = Lottery();
    expect(lottery.runtimeType, lotteryComparation.runtimeType);
  });
}

const jsonResponse = r'''
{
  "success": true,
  "message": "Rodada encontrada com sucesso!",
  "data": {
      "id": 1,
      "date_start": "2022-06-15T20:06:00.000000Z",
      "date_end": "2022-06-11T20:06:00.000000Z",
      "highlighted": 0,
      "finished": 0,
      "deleted": 0,
      "deleted_at": null,
      "administrator_id": 1,
      "created_at": "2022-06-08T20:06:39.000000Z",
      "updated_at": "2022-06-15T19:41:54.000000Z",
      "date_limit_bet": "2022-06-19T02:06:00.000000Z",
      "processed": 0,
      "lottery_ammount": 48,
      "lottery_ammount_formatted": "48,00",
      "date_start_formatted": "QUARTA-FEIRA, 15/06 17:06",
      "date_end_formatted": "SÁBADO, 11/06 17:06",
      "date_limit_bet_formatted": "SÁBADO, 18/06 23:06",
      "lottery_random_id": 2644
  }
}
''';