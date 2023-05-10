import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': vi_VN,
        'en_US': en_US,
      };

  static const Map<String, String> en_US = {
    'Welcome Back!': 'Welcome Back!',
    'Email': 'Email',
    'Password': 'Password',
    'Forgot password?': 'Forgot password?',
    'Login': 'Login',
    'OR': 'OR',
    'Not a member yet?': 'Not a member yet?',
    'Register': 'Register',
  };

  static const Map<String, String> vi_VN = {
    'Welcome Back!': 'Xin chào!',
    'Email': 'Email',
    'Password': 'Mật khẩu',
    'Forgot password?': 'Quên mật khẩu?',
    'Login': 'Đăng nhập',
    'OR': 'HOẶC',
    'Not a member yet?': 'Chưa phải thành viên?',
    'Register': 'Đăng ký',
  };
}
