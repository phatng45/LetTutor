import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:let_tutor/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_translation.dart';
import 'chat_gpt/chat_gpt_page.dart';
import 'components/flushbars.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'models/tutor_schedule.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await FlutterFlowTheme.initialize();
  await (ApiService().getMajors());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() {
    _getSharedPrefs().then((pref) => prefs = pref);
    return _MyAppState();
  }

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  static void To(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void JoinMeeting(
      BookingInfo? bookingInfo, BuildContext context) async {
    if (bookingInfo == null || bookingInfo.studentMeetingLink == '') {
      Flushbars.negative(context, null, 'Could not join this meeting');
      return;
    }

    final studentMeetingLink = bookingInfo.studentMeetingLink!;
    final String roomNameOrUrl = bookingInfo.scheduleDetailId ?? '';
    final String token = studentMeetingLink.split("?token=").last;
    final String subject =
        "${bookingInfo.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name}'s meeting";

    // print("roomNameOrUrl: " + roomNameOrUrl);
    // print("token: " + token);
    // print("subject: " + subject);

    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomNameOrUrl,
      serverUrl: "https://meet.lettutor.com",
      token: token,
      subject: subject,
      isAudioOnly: true,
      isAudioMuted: true,
      isVideoMuted: true,
    );

    await JitsiMeetWrapper.joinMeeting(
        options: options,
        listener: JitsiMeetingListener(
            onOpened: () => Flushbars.positive(
                  context,
                  "Joined meeting",
                  "Welcome to ${bookingInfo.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name}'s meeting!",
                ),
            onConferenceTerminated: (url, error) =>
                Flushbars.negative(context, null, error.toString())));

    print("finished jitsi await");
  }

  static late SharedPreferences prefs;
  static late final String accessToken;

  Future<SharedPreferences> _getSharedPrefs() async {
    return SharedPreferences.getInstance();
  }
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  void setLocale(String locale) {}

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'LetTutor',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Get.deviceLocale ?? const Locale('en', 'US'),
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      color: Colors.indigo,
      translations: AppTranslation(),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page, required this.user})
      : super(key: key);

  final String? initialPage;
  final Widget? page;
  final User user;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  String _currentPageName = 'HomePage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    _scrollController.addListener(_listen);
    _currentPageName = 'CoursesPage'; // widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listen);
    _scrollController.dispose();
    super.dispose();
  }

  bool _showNotch = true;
  bool _isVisible = true;

  void _listen() {
    final ScrollDirection direction =
        _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _show();
    } else if (direction == ScrollDirection.reverse) {
      _hide();
    }
  }

  void _show() {
    if (!_isVisible) {
      setState(() => _isVisible = true);
    }
  }

  void _hide() {
    if (_isVisible) {
      setState(() => _isVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var homePage = HomePageWidget(
      user: widget.user,
    );
    final tabs = {
      'HomePage': homePage,
      'SchedulePage': SchedulePageWidget(),
      'CoursesPage': CoursesPageWidget(),
    };
    return Scaffold(
      backgroundColor:  FlutterFlowTheme.of(context).primaryBackground,
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: tabs.values.toList(),
      ),
      extendBody: false,
      floatingActionButton: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -3, end: -3),
        badgeStyle: badges.BadgeStyle(padding: EdgeInsets.all(7)),
        child: FloatingActionButton(
          onPressed: showChatGPTBottomSheet,
          backgroundColor: Colors.indigo,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.network(
              "https://assets.stickpng.com/images/63c52af590250dd34bd6a9ab.png",
              color: Colors.white,
              colorBlendMode: BlendMode.srcIn,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        height: _isVisible ? 72.0 : 0,
        surfaceTintColor: FlutterFlowTheme.of(context).primaryColor,
        color: FlutterFlowTheme.of(context).primaryColor,
        child: IconTheme(
          data: IconThemeData(color: Colors.indigo),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BottomAppBarButton(
                  onPressed: () {
                    _tabController.animateTo(0);
                  },
                  unselectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsrounded/home/wght500/48px.svg',
                  selectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/home/fill1/48px.svg',
                  isSelected: _tabController.index == 0,
                  name: 'Home'.tr),
              BottomAppBarButton(
                  onPressed: () {
                    _tabController.animateTo(1);
                  },
                  unselectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/event/default/48px.svg',
                  selectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/event/fill1/48px.svg',
                  isSelected: _tabController.index == 1,
                  name: 'Schedule'.tr),
              BottomAppBarButton(
                  onPressed: () {
                    _tabController.animateTo(2);
                  },
                  unselectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/book/default/48px.svg',
                  selectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/book/fill1/48px.svg',
                  isSelected: _tabController.index == 2,
                  name: 'Courses'.tr),
            ],
          ),
        ),
      ),
    );
  }

  void showChatGPTBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => ChatGPTPage(),
    );
  }
}

class BottomAppBarButton extends StatelessWidget {
  const BottomAppBarButton(
      {Key? key,
      required this.onPressed,
      required this.unselectedIconUrl,
      required this.selectedIconUrl,
      required this.isSelected,
      required this.name})
      : super(key: key);

  final String unselectedIconUrl;
  final String selectedIconUrl;
  final bool isSelected;
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: onPressed,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.network(
            isSelected ? selectedIconUrl : unselectedIconUrl,
            colorFilter: ColorFilter.mode(FlutterFlowTheme.of(context).primaryColor, BlendMode.srcIn),
            width: 26,
          ),
          isSelected
              ? Text(
                  name,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: FlutterFlowTheme.of(context).title1Family,
                      fontSize: 15),
                )
              : SizedBox.shrink(),
        ]));
  }
}
