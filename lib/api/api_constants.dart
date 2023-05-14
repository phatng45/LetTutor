import 'package:dio/dio.dart';
import 'package:let_tutor/main.dart';

class ApiConstants {
  static String baseUrl = 'https://sandbox.api.lettutor.com/';

  static Map<String, dynamic> authorization = {
    'Authorization': 'Bearer ' + MyApp.prefs.getString("ACCESS_TOKEN")!
  };

  static Options authorizationOptions = Options(headers: authorization);

  static String register = 'auth/register';
  static String login = 'auth/login';
  static String loginPhone = 'auth/phone-login';

  static String major = 'major';

  static String bookingScheduleDetail = 'booking/schedule-detail';

  static String bookingListStudent = 'booking/list/student';

  static String totalHour = 'call/total';

  static String verifyAccount(String token) =>
      'auth/verifyAccount?token=$token';
  static String loginGoogle = 'auth/google';
  static String loginFacebook = 'auth/facebook';
  static String refreshToken = 'auth/refresh-token';
  static String registerPhone = 'auth/phone-register';
  static String otpResendRegister = 'verify/phone-auth-verify/create';
  static String otpActivatePhoneNumber = 'verify/phone-auth-verify/activate';
  static String forgotPassword = 'user/forgotPassword';

  static String changePassword = 'auth/change-password';
  static String userInfo = 'user/info';
  static String userInfoUpdate = 'user/info';

  static String schedule = 'schedule';

  static String tutorSearch = 'tutor/search';

  static String coursePagination(int perPage, int page) =>
      'course?page=' + page.toString() + '&size=' + perPage.toString();

  static String feedbackPagination(String userId, int perPage, int page) =>
      'feedback/v2/' + userId + '?page=' + page.toString() + '&perPage=' + perPage.toString();

  static String tutorInfo(String userId) => 'tutor/$userId';
}
