class  ApiConstants{
  static String baseUrl = 'https://sandbox.api.lettutor.com/';

  static String register = 'auth/register';
  static String login = 'auth/login';
  static String loginPhone = 'auth/phone-login';
  static String verifyAccount(String token) => 'auth/verifyAccount?token=$token';
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
}