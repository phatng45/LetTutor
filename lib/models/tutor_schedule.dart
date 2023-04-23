import 'package:let_tutor/models/tutor.dart';

class TutorSchedule {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  bool? isBooked;
  List<ScheduleDetails>? scheduleDetails;

  TutorSchedule(
      {this.id,
        this.tutorId,
        this.startTime,
        this.endTime,
        this.startTimestamp,
        this.endTimestamp,
        this.createdAt,
        this.isBooked,
        this.scheduleDetails});

  TutorSchedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    createdAt = json['createdAt'];
    isBooked = json['isBooked'];
    if (json['scheduleDetails'] != null) {
      scheduleDetails = <ScheduleDetails>[];
      json['scheduleDetails'].forEach((v) {
        scheduleDetails!.add(new ScheduleDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tutorId'] = this.tutorId;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['startTimestamp'] = this.startTimestamp;
    data['endTimestamp'] = this.endTimestamp;
    data['createdAt'] = this.createdAt;
    data['isBooked'] = this.isBooked;
    if (this.scheduleDetails != null) {
      data['scheduleDetails'] =
          this.scheduleDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleDetails {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;
  Schedule? scheduleInfo;

  ScheduleDetails(
      {this.startPeriodTimestamp,
        this.endPeriodTimestamp,
        this.id,
        this.scheduleId,
        this.startPeriod,
        this.endPeriod,
        this.createdAt,
        this.updatedAt,
        this.bookingInfo,
        this.isBooked,
        this.scheduleInfo,
      });

  ScheduleDetails.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['bookingInfo'] != null) {
      bookingInfo = <BookingInfo>[];
      json['bookingInfo'].forEach((v) {
        bookingInfo!.add(new BookingInfo.fromJson(v));
      });
    }
    isBooked = json['isBooked'];
    scheduleInfo = json['scheduleInfo'] != null ? Schedule.fromJson(json['scheduleInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startPeriodTimestamp'] = this.startPeriodTimestamp;
    data['endPeriodTimestamp'] = this.endPeriodTimestamp;
    data['id'] = this.id;
    data['scheduleId'] = this.scheduleId;
    data['startPeriod'] = this.startPeriod;
    data['endPeriod'] = this.endPeriod;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.bookingInfo != null) {
      data['bookingInfo'] = this.bookingInfo!.map((v) => v.toJson()).toList();
    }
    data['isBooked'] = this.isBooked;
    if (scheduleInfo != null) {
      data['scheduleInfo'] = scheduleInfo!.toJson();
    } else {
      data['scheduleInfo'] = null;
    }
    return data;
  }
}

class BookingInfo {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  String? recordUrl;
  int? cancelReasonId;
  int? lessonPlanId;
  String? cancelNote;
  String? calendarId;
  bool? isDeleted;
  ScheduleDetails? scheduleDetailInfo;

  BookingInfo(
      {this.createdAtTimeStamp,
        this.updatedAtTimeStamp,
        this.id,
        this.userId,
        this.scheduleDetailId,
        this.tutorMeetingLink,
        this.studentMeetingLink,
        this.studentRequest,
        this.tutorReview,
        this.scoreByTutor,
        this.createdAt,
        this.updatedAt,
        this.recordUrl,
        this.cancelReasonId,
        this.lessonPlanId,
        this.cancelNote,
        this.calendarId,
        this.isDeleted  ,  this.scheduleDetailInfo,
      });

  BookingInfo.fromJson(Map<String, dynamic> json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    studentRequest = json['studentRequest'];
    tutorReview = json['tutorReview'];
    scoreByTutor = json['scoreByTutor'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    recordUrl = json['recordUrl'];
    cancelReasonId = json['cancelReasonId'];
    lessonPlanId = json['lessonPlanId'];
    cancelNote = json['cancelNote'];
    calendarId = json['calendarId'];
    isDeleted = json['isDeleted'];
    scheduleDetailInfo = json["scheduleDetailInfo"] != null ? ScheduleDetails.fromJson(json["scheduleDetailInfo"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAtTimeStamp'] = this.createdAtTimeStamp;
    data['updatedAtTimeStamp'] = this.updatedAtTimeStamp;
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['scheduleDetailId'] = this.scheduleDetailId;
    data['tutorMeetingLink'] = this.tutorMeetingLink;
    data['studentMeetingLink'] = this.studentMeetingLink;
    data['studentRequest'] = this.studentRequest;
    data['tutorReview'] = this.tutorReview;
    data['scoreByTutor'] = this.scoreByTutor;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['recordUrl'] = this.recordUrl;
    data['cancelReasonId'] = this.cancelReasonId;
    data['lessonPlanId'] = this.lessonPlanId;
    data['cancelNote'] = this.cancelNote;
    data['calendarId'] = this.calendarId;
    data['isDeleted'] = this.isDeleted;
    data['scheduleDetailInfo'] = scheduleDetailInfo != null ? scheduleDetailInfo!.toJson() : null;
    return data;
  }
}

class Schedule {
  late String id;
  late String tutorId;
  late String startTime;
  late String endTime;
  late int startTimestamp;
  late int endTimestamp;
  late String createdAt;
  bool isBooked = false;
  List<ScheduleDetails> scheduleDetails = [];
  Tutor? tutorInfo;

  Schedule({
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.createdAt,
    required this.isBooked,
    required this.scheduleDetails,
    this.tutorInfo,
  });

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    createdAt = json['createdAt'];
    isBooked = json['isBooked'] ?? false;
    if (json['scheduleDetails'] != null) {
      scheduleDetails = [];
      json['scheduleDetails'].forEach((v) {
        scheduleDetails.add(ScheduleDetails.fromJson(v));
      });
    }

    tutorInfo = json['tutorInfo'] != null ? Tutor.fromJson(json['tutorInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['tutorId'] = tutorId;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['startTimestamp'] = startTimestamp;
    data['endTimestamp'] = endTimestamp;
    data['createdAt'] = createdAt;
    data['isBooked'] = isBooked;
    data['scheduleDetails'] = scheduleDetails.map((v) => v.toJson()).toList();
    data['tutorInfo'] = tutorInfo?.toJson();
    return data;
  }
}
