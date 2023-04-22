class SearchInfo {
  Filters? filters;
  String? search;
  String? page;
  int? perPage;

  SearchInfo({this.filters, this.search, this.page, this.perPage});

  SearchInfo.fromJson(Map<String, dynamic> json) {
    filters =
    json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
    search = json['search'];
    page = json['page'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.toJson();
    }
    data['search'] = this.search;
    data['page'] = this.page;
    data['perPage'] = this.perPage;
    return data;
  }
}

class Filters {
  List<String>? specialties;
  Nationality? nationality;
  List<String>? tutoringTimeAvailable;

  Filters({this.specialties, this.nationality, this.tutoringTimeAvailable});

  Filters.fromJson(Map<String, dynamic> json) {
    specialties = json['specialties'].cast<String>();
    nationality = json['nationality'] != null
        ? new Nationality.fromJson(json['nationality'])
        : null;
    tutoringTimeAvailable = json['tutoringTimeAvailable'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialties'] = this.specialties;
    if (this.nationality != null) {
      data['nationality'] = this.nationality!.toJson();
    }
    data['tutoringTimeAvailable'] = this.tutoringTimeAvailable;
    return data;
  }
}

class Nationality {
  bool? isVietNamese;
  bool? isNative;

  Nationality({this.isVietNamese, this.isNative});

  Nationality.fromJson(Map<String, dynamic> json) {
    isVietNamese = json['isVietNamese'];
    isNative = json['isNative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isVietNamese'] = this.isVietNamese;
    data['isNative'] = this.isNative;
    return data;
  }
}
