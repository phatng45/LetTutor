import 'package:dio/dio.dart';

import '../main.dart';
import '../models/course.dart';
import '../models/tutor.dart';
import '../models/user.dart';
import 'api_constants.dart';

class ApiService {
  Future<User?> login(String email, String password) async {
    final url = ApiConstants.baseUrl + ApiConstants.login;
    final data = {"email": email, "password": password};
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
