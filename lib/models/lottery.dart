class Lottery {
  int? id;
  String? dateStart;
  String? dateEnd;
  String? dateLimitBet;
  int? processed;
  double? lotteryAmmount;
  String? lotteryAmmountFormatted;
  String? dateStartFormatted;
  String? dateEndFormatted;
  String? dateLimitBetFormatted;
  int? lotteryRandomId;

  Lottery(
      {this.id,
        this.dateStart,
        this.dateEnd,
        this.dateLimitBet,
        this.processed,
        this.lotteryAmmount,
        this.lotteryAmmountFormatted,
        this.dateStartFormatted,
        this.dateEndFormatted,
        this.lotteryRandomId,
        this.dateLimitBetFormatted});



  Lottery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    dateLimitBet = json['date_limit_bet'];
    processed = json['processed'];
    lotteryAmmount = json['lottery_ammount'] * 1.0;
    lotteryAmmountFormatted = json['lottery_ammount_formatted'];
    dateStartFormatted = json['date_start_formatted'];
    dateEndFormatted = json['date_end_formatted'];
    dateLimitBetFormatted = json['date_limit_bet_formatted'];
    lotteryRandomId = json['lottery_random_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_start'] = dateStart;
    data['date_end'] = dateEnd;
    data['date_limit_bet'] = dateLimitBet;
    data['processed'] = processed;
    data['lottery_ammount'] = lotteryAmmount;
    data['lottery_ammount_formatted'] = lotteryAmmountFormatted;
    data['date_start_formatted'] = dateStartFormatted;
    data['date_end_formatted'] = dateEndFormatted;
    data['date_limit_bet_formatted'] = dateLimitBetFormatted;
    data['lottery_random_id'] = lotteryRandomId;
    return data;
  }
}
