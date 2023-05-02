class Major {
  String? id;
  String? key;
  String? englishName;
  String? vietnameseName;
  String? createdAt;
  String? updatedAt;

  Major(
      {this.id,
      this.key,
      this.englishName,
      this.vietnameseName,
      this.createdAt,
      this.updatedAt});

  Major.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    englishName = json['englishName'];
    vietnameseName = json['vietnameseName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['englishName'] = this.englishName;
    data['vietnameseName'] = this.vietnameseName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  static Map<String, Major>? Majors;
}
