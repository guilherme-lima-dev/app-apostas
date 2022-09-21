import 'package:ole_players_app/models/team.dart';

class Matches {
  int? id;
  String? dateMatch;
  Team? teamOwner;
  Team? teamVisitor;
  String? dateMatchFormatted;
  int? finalResultOwner;
  int? finalResultVisitor;
  int? finished;
  String? localMatch;
  String? localTransmission;

  Matches(
      {required this.id,
      required this.dateMatch,
      required this.teamOwner,
      required this.teamVisitor,
      required this.dateMatchFormatted,
      required this.finalResultOwner,
      required this.finalResultVisitor,
      required this.finished,
      required this.localMatch,
      required this.localTransmission});

  static Matches fromJson(dynamic json) {
    return Matches(
      id: json['id'],
      dateMatch: json['date_match'],
      teamOwner:
          json['team_owner'] != null ? Team.fromJson(json['team_owner']) : null,
      teamVisitor: json['team_visitor'] != null
          ? Team.fromJson(json['team_visitor'])
          : null,
      dateMatchFormatted: json['date_match_formatted'],
      finalResultOwner: json['final_result_owner'],
      finalResultVisitor: json['final_result_visitor'],
      finished: json['finished'],
      localMatch: json['local_match'],
      localTransmission: json['local_transmission'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_match'] = this.dateMatch;
    if (this.teamOwner != null) {
      data['team_owner'] = this.teamOwner!.toJson();
    }
    if (this.teamVisitor != null) {
      data['team_visitor'] = this.teamVisitor!.toJson();
    }
    data['date_match_formatted'] = this.dateMatchFormatted;
    data['final_result_owner'] = this.finalResultOwner;
    data['final_result_visitor'] = this.finalResultVisitor;
    data['finished'] = this.finished;
    data['local_match'] = this.localMatch;
    data['local_transmission'] = this.localTransmission;
    return data;
  }

  Matches.stub() {
    id = 1;
    dateMatch = "20/01/2001";
    teamOwner = Team(
        id: 1,
        name: "Boca",
        logo: "img.png",
        abreviation: "BCJ",
        linkLogo: "http://image.com.br/logo.png");
    teamVisitor = Team(
        id: 2,
        name: "Flamengo",
        logo: "img.png",
        abreviation: "FLA",
        linkLogo: "http://image.com.br/logo.png");
    dateMatchFormatted = "20/05/2023";
    finalResultOwner = 2;
    finalResultVisitor = 5;
    finished = 1;
    localMatch = "Santiago Bernabeu";
    localTransmission = "Sport-TV";
  }
}
