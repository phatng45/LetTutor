import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country/countries.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_tutor/api/api_service.dart';
import 'package:let_tutor/components/tutor_specialties_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_toggle_icon.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_widgets.dart';
import 'package:let_tutor/index.dart';
import 'package:let_tutor/main.dart';
import 'package:let_tutor/models/searchInfo.dart';

import '../components/class_schedule_status_widget.dart';
import '../menu_page/menu_page_widget.dart';
import '../models/tutor.dart';
import '../models/user.dart';
import '../schedule_page/schedule_page_widget.dart';
import 'home_page_model.dart';

export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  final String? userImgUrl;
  final User user;

  HomePageWidget({
    Key? key,
    required this.user,
    this.userImgUrl,
  }) : super(key: key);

  @override
  _HomePageWidgetState createState() => homePageWidgetState;

  final homePageWidgetState = _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final int perPage = 10;
  int page = 1;
  List<Tutor> _tutors = [];

  bool isLoading = false;
  final ScrollController _scrollController = new ScrollController();
  SearchInfo? searchInfo;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    _model.textController ??= TextEditingController();
    _getData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getNextPage();
      }
    });
  }

  void _getData() async {
    setState(() {
      isLoading = true;
    });

    _tutors = (await ApiService().tutorPagination(perPage, page, searchInfo))!;

    setState(() {
      page++;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: _buildEndDrawer(),
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ScrollPhysics(),
          child: Column(
            children: [
              TabHeader(
                title: '',
                start: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(900.0),
                      child: SizedBox(
                        width: 37,
                        height: 37,
                        child: Image.network(
                          widget.user.avatar ??
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    onPressed: () {
                      MyApp.To(
                          context,
                          MenuPageWidget(
                            user: widget.user,
                          ));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    _buildUpcomingLesson(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tutors',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        TextButton(
                          onPressed: () =>
                              scaffoldKey.currentState!.openEndDrawer(),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.filter_list_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              SizedBox(width: 5),
                              Text('Filter',
                                  style: FlutterFlowTheme.of(context).subtitle2)
                            ],
                          ),
                        )
                      ],
                    ),
                    _tutors.isEmpty
                        ? Align(
                            alignment: Alignment.topCenter,
                            child: isLoading
                                ? _buildProgressIndicator()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Center(
                                        child: Text('Oops, there is no result.',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1)),
                                  ),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _tutors.length + 1,
                            itemBuilder: (context, index) {
                              if (index == _tutors.length) {
                                return _buildProgressIndicator();
                              } else {
                                final tutor = _tutors[index];
                                return _buildTutorWidget(context, tutor);
                              }
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTutorWidget(BuildContext context, Tutor tutor) {
    var country = Countries.byCodeOrName(
        tutor.country ?? 'VN', tutor.country ?? 'Vietnam');
    // var country = Countries.byCode(tutor.country ?? 'VN');

    return GestureDetector(
      onTap: () => MyApp.To(context, TutorDetailsPageWidget(tutor)),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Color(0x98E4E4E4),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(900.0),
                      child: Image.network(
                        tutor.avatar ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tutor.name ?? 'N/A',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: CountryFlags.flag(
                                  (country.alpha2Code ?? 'vn').toLowerCase(),
                                  height: 22,
                                  width: 22,
                                  // borderRadius: 8,
                                ),
                              ),
                              Text(
                                country.name ?? 'Vietnam',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                          RatingBarIndicator(
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFCA77),
                            ),
                            direction: Axis.horizontal,
                            rating: tutor.rating ?? 0,
                            unratedColor: Color(0xFF9E9E9E),
                            itemCount: 5,
                            itemSize: 20.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: ToggleIcon(
                          onPressed: () {
                            setState(() {
                              tutor.isFavorited = !tutor.isFavorited;
                            });
                          },
                          value: tutor.isFavorited,
                          onIcon: Icon(
                            Icons.favorite_border,
                            color: Color(0xFFFF5686),
                            size: 22.0,
                          ),
                          offIcon: Icon(
                            Icons.favorite_rounded,
                            color: Color(0xFFFF5686),
                            size: 22.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: tutor.specialties == null || tutor.specialties == ''
                      ? SizedBox.shrink()
                      : TutorSpecialtiesWidget(
                          specialties: tutor.specialties,
                        ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    tutor.bio ?? '',
                    maxLines: 4,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildUpcomingLesson(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, .9),
            colors: <Color>[
              Colors.blue.shade600,
              Colors.blue.shade900,
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 3.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Text(
                  'Upcoming Lesson',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                  spreadRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(900.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(900.0),
                              child: Image.network(
                                'https://picsum.photos/seed/46/600',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '[ClassTitle]',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                            Text(
                              '[Teacher]',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                            Text(
                              '[weekday], [dd] [hh:mm - hh:mm]',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 12.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 10.0, 25.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  MyApp.To(context, MeetingPageWidget());
                                },
                                text: 'Enter Lesson Room',
                                icon: Icon(
                                  Icons.people_rounded,
                                  size: 18.0,
                                ),
                                options: FFButtonOptions(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .subtitle2Family,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 14.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family),
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getNextPage() async {
    setState(() {
      isLoading = true;
    });

    List<Tutor> nextPage =
        (await ApiService().tutorPagination(perPage, page, searchInfo))!;

    setState(() {
      isLoading = false;
      _tutors.addAll(nextPage);
      page++;
    });
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }

  final TextEditingController controller = TextEditingController();
  final List<String> _nationalitiesFilters = <String>[];
  late String _specialty = 'All';

  final List<String> _nationalities = <String>[
    'Foreign',
    'Vietnamese',
    'Native English'
  ];

  final List<String> _specialties = <String>[
    'All',
    'English for kids',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS',
    'KET',
    'PET',
    'IELTS',
    'TOEFL',
    'TOEIC',
  ];

  Widget _buildEndDrawer() {
    return Drawer(
        child: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            TabHeader(
              title: 'Filter',
              centerTitle: false,
              // start: IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.chevron_left,
              //       size: 30,
              //       color: Colors.indigo,
              //     )),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Text('Name',
                        textAlign: TextAlign.left,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title1Family,
                              color: Colors.indigo,
                              fontSize: 20,
                            )),
                  ),
                  TextFormField(
                    controller: controller,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      // isDense: true,
                      hintText: 'Enter tutor name',
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyText2
                          .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText2Family,
                              fontSize: 16),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFdddddd),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFdddddd),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: false,
                      fillColor: Color(0xFFE4E4E4),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text('Nationality',
                        textAlign: TextAlign.left,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title1Family,
                              color: Colors.indigo,
                              fontSize: 20,
                            )),
                  ),
                  Wrap(
                    children: _nationalities.map((String nationality) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                        child: FilterChip(
                          showCheckmark: false,
                          selectedColor: Color(0xFFBCE8FF),
                          visualDensity:
                              VisualDensity(horizontal: 0.0, vertical: -4),
                          backgroundColor: Color(0xFFdddddd),
                          side: BorderSide(color: Colors.transparent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          // disabledColor: Colors.black12,
                          label: Text(nationality),
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 15,
                                color:
                                    _nationalitiesFilters.contains(nationality)
                                        ? Color(0xFF2767FF)
                                        : Colors.black45,
                              ),
                          selected: _nationalitiesFilters.contains(nationality),
                          onSelected: (bool value) {
                            setState(() {
                              if (value) {
                                if (!_nationalitiesFilters
                                    .contains(nationality)) {
                                  _nationalitiesFilters.add(nationality);
                                }
                              } else {
                                _nationalitiesFilters
                                    .removeWhere((String name) {
                                  return name == nationality;
                                });
                              }
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Text('Specialties',
                        textAlign: TextAlign.left,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title1Family,
                              color: Colors.indigo,
                              fontSize: 20,
                            )),
                  ),
                  Wrap(
                    children: _specialties.map((String specialty) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                        child: FilterChip(
                          showCheckmark: false,
                          selectedColor: Color(0xFFBCE8FF),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          backgroundColor: Color(0xFFdddddd),
                          side: BorderSide(color: Colors.transparent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          // disabledColor: Colors.black12,
                          label: Text(specialty),
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontSize: 15,
                                    color: _specialty == specialty
                                        ? Color(0xFF2767FF)
                                        : Colors.black45,
                                  ),
                          selected: _specialty == specialty,
                          onSelected: (bool value) {
                            setState(() {
                              if (value) {
                                _specialty = specialty;
                              }
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      NegativeButton(
                        title: 'Reset',
                        onPressed: () => _resetSearch(),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 130,
                        height: 40,
                        child: PositiveButton(
                          title: 'Confirm',
                          onPressed: () => _search(
                              _specialty.toLowerCase().replaceAll(' ', '-'),
                              _nationalitiesFilters.contains('Vietnamese'),
                              _nationalitiesFilters.contains('Native English'),
                              controller.text),
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _search(
      String specialty, bool isVietnamese, bool isNative, String name) async {
    SearchInfo info = SearchInfo();
    info.search = name;
    info.filters = Filters(
        specialties: [specialty],
        nationality:
            Nationality(isVietNamese: isVietnamese, isNative: isNative));

    setState(() {
      page = 1;
      searchInfo = info;
      _getData();
    });

    Navigator.pop(context);
    // widget.onSearchInfoReceived!(info);
  }

  _resetSearch() {
    setState(() {
      page = 1;
      searchInfo = null;
      _getData();
    });

    Navigator.pop(context);
  }
}
