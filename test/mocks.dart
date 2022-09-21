import 'package:mocktail/mocktail.dart';
import 'package:ole_players_app/interfaces/http_client_interface.dart';
import 'package:ole_players_app/services/matches_service.dart';

class IHttpClientMock extends Mock implements IHttpClient {}
class MatchesServiceMock extends Mock implements MatchesService{}