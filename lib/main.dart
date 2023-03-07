import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:let_tutor/home_page_copy/tutor_detailed_info_widget.dart';
import 'package:let_tutor/models/bottom_nav_bar_widget.dart';

import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
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
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  late ScrollController _controller;
  String _currentPageName = 'HomePage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_listen);
    _currentPageName ='SchedulePage';// widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }
  @override
  void dispose() {
    _controller.removeListener(_listen);
    _controller.dispose();
    super.dispose();
  }

  bool _showNotch = true;
  bool _isVisible = true;

  void _listen() {
    final ScrollDirection direction = _controller.position.userScrollDirection;
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
      'HomePage': HomePageWidget(),
      'SchedulePage': SchedulePageWidget(),
      'ProfilePage': ProfilePageWidget(),
      'TutorDetailedInfoPage': TutorDetailedInfoWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      extendBody: true,
      bottomNavigationBar: BottomNavBarWidget(
        shape: _showNotch ? const CircularNotchedRectangle() : null,
        isVisible: _isVisible,

        // currentIndex: currentIndex,
        // onTap: (i) => setState(() {
        //   _currentPage = null;
        //   _currentPageName = tabs.keys.toList()[i];
        // }),
        // backgroundColor: Colors.white,
        // selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        // unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
        // selectedBackgroundColor: Color(0x00000000),
        // borderRadius: 8.0,
        // itemBorderRadius: 8.0,
        // margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        // padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        // width: MediaQuery.of(context).size.width * 1.0,
        // elevation: 0.0,
        // items: [
        //   FloatingNavbarItem(
        //     customWidget: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(
        //           currentIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
        //           color: currentIndex == 0
        //               ? FlutterFlowTheme.of(context).primaryColor
        //               : FlutterFlowTheme.of(context).secondaryText,
        //           size: 24.0,
        //         ),
        //         Text(
        //           'Home',
        //           overflow: TextOverflow.ellipsis,
        //           style: TextStyle(
        //             color: currentIndex == 0
        //                 ? FlutterFlowTheme.of(context).primaryColor
        //                 : FlutterFlowTheme.of(context).secondaryText,
        //             fontSize: 11.0,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   FloatingNavbarItem(
        //     customWidget: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(
        //           Icons.access_time_rounded,
        //           color: currentIndex == 1
        //               ? FlutterFlowTheme.of(context).primaryColor
        //               : FlutterFlowTheme.of(context).secondaryText,
        //           size: 24.0,
        //         ),
        //         Text(
        //           'Schedule',
        //           overflow: TextOverflow.ellipsis,
        //           style: TextStyle(
        //             color: currentIndex == 1
        //                 ? FlutterFlowTheme.of(context).primaryColor
        //                 : FlutterFlowTheme.of(context).secondaryText,
        //             fontSize: 11.0,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   FloatingNavbarItem(
        //     customWidget: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(
        //           currentIndex == 2
        //               ? Icons.person_rounded
        //               : Icons.person_outline,
        //           color: currentIndex == 2
        //               ? FlutterFlowTheme.of(context).primaryColor
        //               : FlutterFlowTheme.of(context).secondaryText,
        //           size: 24.0,
        //         ),
        //         Text(
        //           'Profile',
        //           overflow: TextOverflow.ellipsis,
        //           style: TextStyle(
        //             color: currentIndex == 2
        //                 ? FlutterFlowTheme.of(context).primaryColor
        //                 : FlutterFlowTheme.of(context).secondaryText,
        //             fontSize: 11.0,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   FloatingNavbarItem(
        //     customWidget: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(
        //           currentIndex == 3 ? Icons.home_rounded : Icons.home_outlined,
        //           color: currentIndex == 3
        //               ? FlutterFlowTheme.of(context).primaryColor
        //               : FlutterFlowTheme.of(context).secondaryText,
        //           size: 24.0,
        //         ),
        //         Text(
        //           'Home',
        //           overflow: TextOverflow.ellipsis,
        //           style: TextStyle(
        //             color: currentIndex == 3
        //                 ? FlutterFlowTheme.of(context).primaryColor
        //                 : FlutterFlowTheme.of(context).secondaryText,
        //             fontSize: 11.0,
        //           ),
        //         ),
        //       ],
        //     ),
        //   )
        // ],
      ),
    );
  }
}
