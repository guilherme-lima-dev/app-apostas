import 'package:ole_players_app/models/matches.dart';

abstract class MatchesState{}

class InitialMatchesState extends MatchesState{}
class LoadingMatchesState extends MatchesState{}
class SuccessMatchesState extends MatchesState{
  final List<Matches> matches;

  SuccessMatchesState(this.matches);

}
class ErrorMatchesState extends MatchesState{
  final String message;

  ErrorMatchesState(this.message);
}