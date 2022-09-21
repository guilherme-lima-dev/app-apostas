class Team {
  int? id;
  String? name;
  String? logo;
  String? abreviation;
  String? linkLogo;

  Team({required this.id, required this.name, required this.logo, required this.abreviation, required this.linkLogo});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    abreviation = json['abreviation'];
    linkLogo = json['link_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['abreviation'] = this.abreviation;
    data['link_logo'] = this.linkLogo;
    return data;
  }
}