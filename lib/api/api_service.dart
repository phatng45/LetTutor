import 'package:dio/dio.dart';

import '../main.dart';
import '../models/user.dart';
import 'api_constants.dart';

class ApiService{
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
}