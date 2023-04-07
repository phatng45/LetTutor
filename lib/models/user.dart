class User {
  String? name;
  String? country;
  String? phone;
  String? birthday;
  String? level;
  List<String>? learnTopics;
  List<String>? testPreparations;

  User(
      {this.name,
      this.country,
      this.phone,
      this.birthday,
      this.level,
      this.learnTopics,
      this.testPreparations});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    birthday = json['birthday'];
    level = json['level'];
    learnTopics = json['learnTopics'].cast<String>();
    testPreparations = json['testPreparations'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['level'] = this.level;
    data['learnTopics'] = this.learnTopics;
    data['testPreparations'] = this.testPreparations;
    return data;
  }
}
