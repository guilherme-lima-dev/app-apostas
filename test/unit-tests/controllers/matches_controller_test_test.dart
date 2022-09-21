import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ole_players_app/controllers/matches/matches_controller.dart';
import 'package:ole_players_app/models/matches.dart';
import '../../mocks.dart';

void main() {

  test('deve preencher a lista de matches corretamente', () async {
      final service = MatchesServiceMock();
      when(() => service.getAll("1")).thenAnswer((_) async => [Matches.stub()]);
      final controller = MatchesController(service);

      await controller.fetchAllMatches();
      expect(controller.matches.length, 1);
  });
}