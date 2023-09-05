import 'package:ole_players_app/models/lottery.dart';
import 'package:ole_players_app/models/matches.dart';

class Bet {
  int? id;
  int? lotteryId;
  int? userId;
  int? finalScore;
  int? finished;
  int? deleted;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? bettingSetId;
  int? processingPoints;
  int? pointsTotal;
  List<BetLines>? betLines;
  Lottery? lottery;

  Bet(
      {this.id,
      this.lotteryId,
      this.userId,
      this.finalScore,
      this.finished,
      this.deleted,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.bettingSetId,
      this.processingPoints,
      this.pointsTotal,
      this.betLines,
      this.lottery});

  Bet.fromJson(Map<String, dynamic> json) {
    // print(json);
    id = json['id'];
    lotteryId = json['lottery_id'];
    userId = json['user_id'];
    finalScore = json['final_score'];
    finished = json['finished'];
    deleted = json['deleted'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bettingSetId = json['betting_set_id'];
    processingPoints = json['processing_points'];
    pointsTotal = json['points_total'];
    if (json['bet_lines'] != null) {
      betLines = <BetLines>[];
      json['bet_lines'].forEach((v) {
        betLines!.add(new BetLines.fromJson(v));
      });
    }
    lottery =
    json['lottery'] != null ? new Lottery.fromJson(json['lottery']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lottery_id'] = this.lotteryId;
    data['user_id'] = this.userId;
    data['final_score'] = this.finalScore;
    data['finished'] = this.finished;
    data['deleted'] = this.deleted;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['betting_set_id'] = this.bettingSetId;
    data['processing_points'] = this.processingPoints;
    data['points_total'] = this.pointsTotal;
    if (this.betLines != null) {
      data['bet_lines'] = this.betLines!.map((v) => v.toJson()).toList();
    }
    if (this.lottery != null) {
      data['lottery'] = this.lottery!.toJson();
    }
    return data;
  }
}

class BetLines {
  int? id;
  int? betId;
  int? matchesId;
  int? shotTeamOwner;
  int? shotTeamVisitor;
  int? finished;
  String? createdAt;
  String? updatedAt;
  int? pointsTotal;
  int? pointsMatch;
  Matches? matches;

  BetLines(
      {this.id,
        this.betId,
        this.matchesId,
        this.shotTeamOwner,
        this.shotTeamVisitor,
        this.finished,
        this.createdAt,
        this.updatedAt,
        this.pointsTotal,
        this.pointsMatch,
        this.matches});

  BetLines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    betId = json['bet_id'];
    matchesId = json['matches_id'];
    shotTeamOwner = json['shot_team_owner'];
    shotTeamVisitor = json['shot_team_visitor'];
    finished = json['finished'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pointsTotal = json['points_total'];
    pointsMatch = json['points_match'];
    matches =
    json['matches'] != null ? Matches.fromJson(json['matches']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bet_id'] = this.betId;
    data['matches_id'] = this.matchesId;
    data['shot_team_owner'] = this.shotTeamOwner;
    data['shot_team_visitor'] = this.shotTeamVisitor;
    data['finished'] = this.finished;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['points_total'] = this.pointsTotal;
    data['points_match'] = this.pointsMatch;
    if (this.matches != null) {
      data['matches'] = this.matches!.toJson();
    }
    return data;
  }
}