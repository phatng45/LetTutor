import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/course.dart';
import '../models/searchInfo.dart';
import '../models/tutor.dart';
import '../models/tutor_schedule.dart';
import '../models/user.dart';
import 'api_constants.dart';

class ApiService {
  Future<User?> login(
      String email, String password, BuildContext context) async {
    final url = ApiConstants.baseUrl + ApiConstants.login;
    final data = {"email": email, "password": password};
    try {
      final response = await Dio().post(
        url,
        data: data,
      );

      if (response.statusCode == 200) {
        print("response status code is 200");

        User user = User.fromJson(response.data["user"]);

        print("user: " + user.toString());

        String accessToken = response.data["tokens"]["access"]["token"];
        MyApp.prefs.setString("ACCESS_TOKEN", accessToken);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login successfully!'),
        ));

        return user;
      }
    } catch (e) {
      if (e is DioError)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!),
        ));
    }
    return null;
  }

  Future<User?> register(
      String email, String password, BuildContext context) async {
    final url = ApiConstants.baseUrl + ApiConstants.register;
    final data = {"email": email, "password": password};

    try {
      final response = await Dio().post(url,
          data: data,
          options: Options(contentType: Headers.formUrlEncodedContentType));

      User user = User.fromJsonFromRegister(response.data["user"]);

      String accessToken = response.data["tokens"]["access"]["token"];
      MyApp.prefs.setString("ACCESS_TOKEN", accessToken);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Account created successfully!'),
      ));

      return user;
    } catch (e) {
      if (e is DioError)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!),
        ));
    }

    return null;
  }

  Future<User?> updateUserInfo(
      String name,
      String country,
      String phone,
      String birthday,
      String level,
      List<String> learnTopics,
      List<String> testPreparations,
      BuildContext context) async {
    final url = ApiConstants.baseUrl + ApiConstants.userInfo;
    var data = {
      "name": name,
      "country": country,
      "phone": phone,
      "birthday": birthday,
      "level": level,
      "learnTopics": learnTopics,
      "testPreparations": testPreparations
    };
    try {
      final response = await Dio().put(
        url,
        data: data,
        options: ApiConstants.authorizationOptions,
      );
      User user = User.fromJsonFromRegister(response.data["user"]);
      Flushbar(
        title: "Updated!",
        message: "User profile updated successfully",
        duration: Duration(seconds: 1, milliseconds: 500),
        borderRadius: BorderRadius.circular(20),
        margin: EdgeInsets.all(10),
        flushbarStyle: FlushbarStyle.FLOATING,
        backgroundColor: Colors.grey.shade200,
        messageColor: Colors.indigo,
        titleColor: Colors.indigo,
      )..show(context);
      String accessToken = response.data["tokens"]["access"]["token"];
      MyApp.prefs.setString("ACCESS_TOKEN", accessToken);
      return user;
    } catch (e) {
      if (e is DioError)
        Flushbar(
          title: "Failed",
          message: e.message,
          duration: Duration(seconds: 1, milliseconds: 500),
          borderRadius: BorderRadius.circular(20),
          margin: EdgeInsets.all(10),
          flushbarStyle: FlushbarStyle.FLOATING,
          backgroundColor: Colors.grey.shade200,
          messageColor: Colors.indigo,
          titleColor: Colors.indigo,
        )..show(context);
    }
    return null;
  }

  Future<List<Tutor>?> tutorPagination(
      int perPage, int page, SearchInfo? searchInfo) async {
    final url = ApiConstants.baseUrl + ApiConstants.tutorSearch;

    final data = searchInfo != null
        ? {
            "filters": {
              "specialties": searchInfo.filters!.specialties,
              // "nationality": {
              //   "isVietNamese": searchInfo.filters!.nationality!.isVietNamese,
              //   "isNative": searchInfo.filters!.nationality!.isNative
              // }, // BUG
              "tutoringTimeAvailable": [null, null]
            },
            "search": searchInfo.search,
            "page": page,
            "perPage": perPage
          }
        : {
            "page": page,
            "perPage": perPage,
          };

    print("data $data");

    final response = await Dio()
        .post(url, data: data, options: ApiConstants.authorizationOptions);

    if (response.statusCode == 200) {
      List<Tutor> tutors = (response.data["rows"] as List)
          .map((x) => Tutor.fromJson(x))
          .toList();

      return tutors;
    }

    return null;
  }

  Future<List<Course>?> coursePagination(int perPage, int page) async {
    final url =
        ApiConstants.baseUrl + ApiConstants.coursePagination(perPage, page);
    final response =
        await Dio().get(url, options: ApiConstants.authorizationOptions);

    if (response.statusCode == 200) {
      List<Course> courses = (response.data["data"]["rows"] as List)
          .map((x) => Course.fromJson(x))
          .toList();

      return courses;
    }

    return null;
  }

  Future<Tutor?> tutorById(String userId) async {
    final url = ApiConstants.baseUrl + ApiConstants.tutorInfo(userId);
    final response =
        await Dio().get(url, options: ApiConstants.authorizationOptions);

    if (response.statusCode == 200) {
      Tutor tutor = Tutor.fromJsonFromGetTutorById(response.data);

      return tutor;
    }

    return null;
  }

  Future<List<TutorSchedule>?> tutorScheduleById(
      String userId, DateTime start, DateTime end) async {
    final url = ApiConstants.baseUrl + ApiConstants.schedule;
    final response = await Dio()
        .get(url, options: ApiConstants.authorizationOptions, queryParameters: {
      "tutorId": userId,
      "startTimestamp": start.millisecondsSinceEpoch,
      "endTimestamp": end.millisecondsSinceEpoch
    });

    if (response.statusCode == 200) {
      print(response.data["scheduleOfTutor"]);

      List<TutorSchedule> schedules = (response.data["scheduleOfTutor"] as List)
          .map((x) => TutorSchedule.fromJson(x))
          .toList();

      return schedules;
    }

    return null;
  }

  Future<bool> book(String? id) async {
    final url = ApiConstants.baseUrl + ApiConstants.booking;
    final Map<String, dynamic> data = {
      "scheduleDetailIds": [id!]
    };

    try {
      final response = await Dio().post(url,
          options: Options(
            headers: {
              'authorization':
                  'Bearer ' + MyApp.prefs.getString("ACCESS_TOKEN")!,
              "content-Type": "application/json;encoding=utf-8",
            },
          ),
          data: json.encode(data));

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<List<BookingInfo>?> getSchedule(int page, int perPage) async {
    final url = ApiConstants.baseUrl + ApiConstants.bookingListStudent;

    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final response = await Dio()
        .get(url, options: ApiConstants.authorizationOptions, queryParameters: {
      "page": page,
      "perPage": perPage,
      "dateTimeGte": currentTime,
      "orderBy": "meeting",
      "sortBy": "asc",
    });

    print(response.data["data"]["rows"]);

    if (response.statusCode == 200) {
      List<BookingInfo> schedules = (response.data["data"]["rows"] as List)
          .map((schedule) => BookingInfo.fromJson(schedule))
          .toList();
      return schedules;
    }
    return null;
  }

  Future<List<BookingInfo>?> getHistory(int page, int perPage) async {
    final url = ApiConstants.baseUrl + ApiConstants.bookingListStudent;

    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final response = await Dio()
        .get(url, options: ApiConstants.authorizationOptions, queryParameters: {
      "page": page,
      "perPage": perPage,
      "dateTimeLte": currentTime,
      "orderBy": "meeting",
      "sortBy": "desc",
    });

    print(response.data["data"]["rows"]);

    if (response.statusCode == 200) {
      List<BookingInfo> schedules = (response.data["data"]["rows"] as List)
          .map((schedule) => BookingInfo.fromJson(schedule))
          .toList();
      return schedules;
    }
    return null;
  }

  Future<int?> getTotalHour() async {
    final url = ApiConstants.baseUrl + ApiConstants.totalHour;

    final response =
        await Dio().get(url, options: ApiConstants.authorizationOptions);

    if (response.statusCode == 200) {
      return response.data["total"];
    } else {
      return null;
    }
  }
}
