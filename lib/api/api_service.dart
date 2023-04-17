import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/course.dart';
import '../models/tutor.dart';
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
        User user = User.fromJson(response.data["user"]);
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

  Future<List<Tutor>?> tutorPagination(int perPage, int page) async {
    final url =
        ApiConstants.baseUrl + ApiConstants.tutorPagination(perPage, page);
    final response =
        await Dio().get(url, options: ApiConstants.authorizationOptions);

    if (response.statusCode == 200) {
      List<Tutor> tutors = (response.data["tutors"]["rows"] as List)
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
}
