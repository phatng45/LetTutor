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

    // forgot password page
    'Forgot Password?': 'Quên mật khẩu?',
    'Provide your account\'s email for which you want to reset password.':
        'Hãy cung cấp email mà bạn muốn đặt lại mật khẩu.',
    'Cancel': 'Hủy',
    'Send Reset Link': 'Gửi đường dẫn',
    'We just sent you a reset password link over to ':
        'Chúng tôi đã gửi một đường dẫn để đặt lại mật khẩu đến ',
    '\nPlease login again once you have reset your password from there.':
        '\nHãy đăng nhập lại khi bạn đã hoàn thành từ đó.',
    "Could not send reset link": "Không thể gửi",
    "Please check your email.": "Vui lòng kiểm tra lại email của bạn.",
    'Back to Login': 'Trở về trang đăng nhập',

    // main page
    'Home': 'Trang chủ',
    'Schedule': 'Lịch học',
    'Courses': 'Khoá học',

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

    // schedule page
    'You haven\'t booked any class.': 'Bạn chưa đặt lịch cho lớp nào',
    'Join meeting': 'Tham gia',

    // history page
    'History': 'Lịch sử',
    'The following is a list of lessons you have attended\nYou can review the details of the lessons you have attended':
        'Danh sách các buổi học bạn đã tham gia trước đó\nBạn có thể xem lại chi tiết các buổi học tại đây.',

    // course page
    'Discover': 'Khám phá',

    // course details page
    'Why take this course': 'Tại sao bạn nên học khóa học này',
    'What will you be able to do': 'Bạn sẽ có thể làm gì',
    'Topics': 'Danh sách chủ đề',

    // menu page
    " (Tutor)": " (Gia sư)",
    " (Student)": " (Học sinh)",
    'Update Information': 'Cập nhật thông tin',
    'Become a Tutor': 'Trở thành gia sư',
    'Dark mode': 'Chế độ Tối',
    'Language': 'Ngôn ngữ',
    'English': 'Tiếng Việt',
    'Change Password': 'Đổi mật khẩu',
    'Remove ChatGPT History': 'Xóa lịch sử ChatGPT',
    'Logout': 'Đăng xuất',

    // update information page
    'Country': 'Quốc gia',
    'Email Address': 'Địa chỉ email',
    'Phone Number': 'Số điện thoại',
    'Birthday': 'Ngày sinh',
    'Level': 'Trình độ',
    'Want to learn': 'Muốn học',
    'Study Schedule': 'Lịch học',
    'Save changes': 'Lưu thay đổi',
    'Remove history?': 'Xóa lịch sử?',
    'Are you sure you want to delete the conversation? You cannot undo this action.':
        'Xác nhận xóa? Bạn không thể hoàn tác hành động này',
    "Remove": "Xóa",
  };
}
