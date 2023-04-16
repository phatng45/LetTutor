import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:let_tutor/search_page/search_page_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterFlowTheme.initialize();

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

  static late SharedPreferences prefs;
  static late final String accessToken;

  Future<SharedPreferences> _getSharedPrefs() async {
    return SharedPreferences.getInstance();
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'LetTutor',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
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
    _tabController = TabController(length: 6, vsync: this);
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

    final tabs = {
      'HomePage': HomePageWidget(
        onSearchPressed: () => _tabController.animateTo(4),
       user: widget.user,
      ),
      'SchedulePage': SchedulePageWidget(),
      'CoursesPage': CoursesPageWidget(),
      // 'ProfilePage': ProfilePageWidget(),
      'SearchPage': SearchPage(
        onBackPressed: () => _tabController.animateTo(0),
      ),
      // 'TutorDetailsPage': TutorDetailsPageWidget(),
      // 'PdfPage': PdfPageWidget(),
      // 'HistoryPage': HistoryPageWidget(),
      // 'CourseDetailsPage': CourseDetailsPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      //body: _currentPage ?? tabs[_currentPageName],
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: tabs.values.toList(),
      ),
      extendBody: false,
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
                  name: 'Home'),
              BottomAppBarButton(
                  onPressed: () {
                    _tabController.animateTo(1);
                  },
                  unselectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/event/default/48px.svg',
                  selectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/event/fill1/48px.svg',
                  isSelected: _tabController.index == 1,
                  name: 'Schedule'),
              BottomAppBarButton(
                  onPressed: () {
                    _tabController.animateTo(2);
                  },
                  unselectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/book/default/48px.svg',
                  selectedIconUrl:
                      'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/book/fill1/48px.svg',
                  isSelected: _tabController.index == 2,
                  name: 'Courses'),
              // BottomAppBarButton(
              //     onPressed: () {
              //       _tabController.animateTo(3);
              //     },
              //     unselectedIconUrl:
              //         'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/menu/default/48px.svg',
              //     selectedIconUrl:
              //         'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsoutlined/menu/default/48px.svg',
              //     isSelected: _tabController.index == 3,
              //     name: 'Menu'),
            ],
          ),
        ),
      ),
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
            colorFilter: ColorFilter.mode(Colors.indigo, BlendMode.srcIn),
            width: 26,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: FlutterFlowTheme.of(context).title1Family,
                fontSize: 15),
          ),
        ]));
  }
}
