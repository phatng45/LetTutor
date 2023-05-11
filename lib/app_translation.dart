import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': vi_VN,
      };

  static const Map<String, String> vi_VN = {
    // login page
    'Welcome Back!': 'Xin chào!',
    'Email': 'Email',
    'Password': 'Mật khẩu',
    'Forgot password?': 'Quên mật khẩu?',
    'Login': 'Đăng nhập',
    'OR': 'HOẶC',
    'Not a member yet?': 'Chưa phải thành viên?',
    'Register': 'Đăng ký',

    // signup page
    'Hello, Friend!': 'Xin chào!',
    'Confirm password': 'Xác nhận mật khẩu',
    'Create Account': 'Đăng ký',
    'Already have your account?': 'Đã có tài khoản?',

    // main page
    'Home': 'Trang chủ',
    'Schedule': 'Lịch học',
    'Courses': 'Giáo trình',

    //home page
    'Filter': 'Bộ lọc',
    'Name': 'Tên',
    'Enter tutor name': 'Nhập tên gia sư',
    'Nationality': 'Quốc tịch',
    'Specialties': 'Chuyên ngành',
    'Foreign': 'Nước ngoài',
    'Vietnamese': 'Việt Nam',
    'Native English': 'Tiếng Anh Bản Ngữ',
    'English for kids': 'Tiếng Anh cho trẻ em',
    'English for Business': 'Tiếng Anh cho công việc',
    'Conversational': 'Giao tiếp',
    'Search': 'Tìm kiếm',
    'Reset': 'Đặt lại',
    'Welcome To LetTutor': 'Chào bạn đến với LetTutor',
    'Start scrolling down to explore more tutors!':
        'Cuộn xuống để bắt đầu khám phá!',
    'Upcoming Lesson': 'Buổi học tiếp theo',
    '(starts in': '(bắt đầu trong',
    'Join now': 'Tham gia',
    'Total lesson time:': 'Tổng thời gian học:',
    'hours': 'giờ',
    'minutes': 'phút',
    'Tutors': 'Gia sư',
    'There is no tutor matched this filter.': 'Không có gia sư nào phù hợp.',
    'English for Kids': 'Tiếng Anh cho trẻ em',
    'Business English': 'Tiếng Anh cho công việc',
    'Conversational English': 'Tiếng Anh cho giao tiếp',

    // chatgpt page
    'ChatGPT may produce inaccurate information about people, places, or facts.':
        'ChatGPT có thể cung cấp thông tin không chính xác về người, địa điểm hoặc sự kiện.',
    'Send a message': 'Gửi tin nhắn',
  };
}
