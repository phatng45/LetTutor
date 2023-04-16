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
      print(response.data["user"]);

      User user = User.fromJsonRegister(response.data["user"]);

      print(response.data["user"]);
      print("USER: $user");
      String accessToken = response.data["tokens"]["access"]["token"];
      MyApp.prefs.setString("ACCESS_TOKEN", accessToken);
      return user;
    } catch (e) {
      if (e is DioError)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!),
        ));
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
