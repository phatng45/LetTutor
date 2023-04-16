class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  WalletInfo? walletInfo;
  List<String>? courses;
  String? requireNote;
  String? level;
  List<String>? learnTopics;
  List<String>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  String? studySchedule;
  bool? canSendMessage;

  User(
      {this.id,
      this.email,
      this.name,
      this.avatar,
      this.country,
      this.phone,
      this.roles,
      this.language,
      this.birthday,
      this.isActivated,
      this.walletInfo,
      this.courses,
      this.requireNote,
      this.level,
      this.learnTopics,
      this.testPreparations,
      this.isPhoneActivated,
      this.timezone,
      this.studySchedule,
      this.canSendMessage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = json['roles'].cast<String>();
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    walletInfo = json['walletInfo'] != null
        ? new WalletInfo.fromJson(json['walletInfo'])
        : null;
    courses = json['courses'].cast<String>();
    requireNote = json['requireNote'];
    level = json['level'];
    learnTopics = json['learnTopics'].cast<String>();
    testPreparations = json['testPreparations'].cast<String>();
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
  }

  User.fromJsonRegister(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    requireNote = json['requireNote'];
    level = json['level'];
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['roles'] = this.roles;
    data['language'] = this.language;
    data['birthday'] = this.birthday;
    data['isActivated'] = this.isActivated;
    if (this.walletInfo != null) {
      data['walletInfo'] = this.walletInfo!.toJson();
    }
    data['courses'] = this.courses;
    data['requireNote'] = this.requireNote;
    data['level'] = this.level;
    data['learnTopics'] = this.learnTopics;
    data['testPreparations'] = this.testPreparations;
    data['isPhoneActivated'] = this.isPhoneActivated;
    data['timezone'] = this.timezone;
    data['studySchedule'] = this.studySchedule;
    data['canSendMessage'] = this.canSendMessage;
    return data;
  }
}

class WalletInfo {
  String? id;
  String? userId;
  String? amount;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  int? bonus;

  WalletInfo(
      {this.id,
      this.userId,
      this.amount,
      this.isBlocked,
      this.createdAt,
      this.updatedAt,
      this.bonus});

  WalletInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['amount'] = this.amount;
    data['isBlocked'] = this.isBlocked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['bonus'] = this.bonus;
    return data;
  }
}
