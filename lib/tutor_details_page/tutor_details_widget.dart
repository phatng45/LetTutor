import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_video_player.dart';
import 'package:let_tutor/models/tutor.dart';
import 'package:let_tutor/models/tutor_schedule.dart';

import '../api/api_service.dart';
import '../components/copied_country.dart';
import '../components/flushbars.dart';
import '../components/my_chip.dart';
import '../components/tutor_specialties_widget.dart';
import '../report_dialog.dart';
import '../review_dialog.dart';
import '../schedule_page/schedule_page_widget.dart';
import 'tutor_details_model.dart';

export 'tutor_details_model.dart';

class TutorDetailsPageWidget extends StatefulWidget {
  const TutorDetailsPageWidget(this.userId, {Key? key}) : super(key: key);

  final String userId;

  @override
  _TutorDetailsPageWidgetState createState() => _TutorDetailsPageWidgetState();
}

class _TutorDetailsPageWidgetState extends State<TutorDetailsPageWidget> {
  late TutorDetailsPageModel _model;
  Tutor? tutor;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late var country = Countries.byCodeOrName(
      tutor?.country ?? tutor?.user?.country ?? 'VN',
      tutor?.country ?? tutor?.user?.country ?? 'Vietnam');

  List<TutorSchedule>? schedules;

  @override
  void initState() {
    super.initState();

    _getTutorById(widget.userId);
    _getScheduleById(widget.userId);
    _model = createModel(context, () => TutorDetailsPageModel());
    _model.textController ??= TextEditingController();
  }

  void _getTutorById(String userId) async {
    var tutor = (await ApiService().tutorById(userId));

    if (tutor != null)
      setState(() {
        this.tutor = tutor;
      });
  }

  void _getScheduleById(String userId) async {
    var start = DateTime.now();
    var end = start.add(Duration(days: 7));
    var newSchedules =
        (await ApiService().tutorScheduleById(userId, start, end));

    if (newSchedules != null && mounted) {
      newSchedules = newSchedules
        ..sort((a, b) {
          var timeA =
              DateTime.fromMillisecondsSinceEpoch(a.startTimestamp ?? 0);
          var timeB =
              DateTime.fromMillisecondsSinceEpoch(b.startTimestamp ?? 0);
          return timeA.compareTo(timeB);
        });

      setState(() {
        this.schedules = newSchedules;
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabHeader(
                title: '',
                centerTitle: true,
                start: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: FlutterFlowTheme.of(context).primaryColor,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
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
                    color: FlutterFlowTheme.of(context)
                        .secondaryBackground, // Color(0x98E4E4E4),
                  ),
                ),
                child: Column(
                  children: [
                    _buildTutorWidget(context, tutor),
                    Text(
                      tutor?.bio ?? 'N/A',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    SizedBox(height: 10),
                    _buildTutorInteraction(context, tutor),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          elevation: 0,
                        ),
                        onPressed: _showBookBottomSheet,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.edit_calendar_rounded),
                            SizedBox(width: 5),
                            Text('Book Now',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .subtitle1Family,
                                        color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Languages',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    MyChip(
                        data: tutor?.country ?? tutor?.user?.country ?? 'N/A'),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black12,
                    ),
                    Text(
                      'Specialties',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    TutorSpecialtiesWidget(
                        specialties: tutor?.specialties ?? 'N/A'),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black12,
                    ),
                    Text(
                      'Introduction',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    SizedBox(
                      height: 300,
                      child: tutor == null || tutor?.video == null
                          ? SizedBox.shrink()
                          : Center(
                              child: FlutterFlowVideoPlayer(
                                path: tutor?.video ?? '',
                                videoType: VideoType.network,
                                autoPlay: false,
                                looping: true,
                                showControls: true,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black12,
                    ),
                    Text(
                      'Teaching Experiences',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    Text(
                      tutor?.experience ?? 'N/A',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontSize: 16.0,
                          ),
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black12,
                    ),
                    Text(
                      'Interests',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    Text(
                      tutor?.interests ?? 'N/A',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontSize: 16.0,
                          ),
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black12,
                    ),
                    Text(
                      'Reviews',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).title1Family,
                            fontSize: 30.0,
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

  void _showBookBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * .7,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Select a Class',
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.white)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, bottom: 10),
                      child: schedules == null
                          ? Text('This tutor did not open any class.',
                              style: FlutterFlowTheme.of(context).subtitle1)
                          : GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              shrinkWrap: true,
                              children: List.generate(
                                schedules!.length,
                                (index) {
                                  final schedule = schedules![index];

                                  return _buildClass(schedule, context);
                                },
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ElevatedButton _buildClass(TutorSchedule schedule, BuildContext context) {
    final String date = DateFormat('EEE, MMM d').format(
            DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp ?? 0)) +
        "\n" +
        DateFormat('HH:mm').format(
            DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp ?? 0)) +
        " - " +
        DateFormat('HH:mm').format(
            DateTime.fromMillisecondsSinceEpoch(schedule.endTimestamp ?? 0));

    final bool isClassUnavailable = (schedule.isBooked ?? false) ||
        DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp ?? 0)
            .isBefore(DateTime.now());

    return ElevatedButton(
        onPressed: isClassUnavailable
            ? null
            : () async {
                final res = await ApiService()
                    .book(schedule.scheduleDetails?[0].id ?? "");
                if (res) {
                  schedule.isBooked = true;
                  setState(() {
                    Navigator.pop(context);
                  });
                  Flushbars.positive(
                      context, null, 'Booked successfully! See you soon!');
                } else {
                  Flushbars.negative(context, "Book Failed.", null);
                }
              },
        child: Container(
          padding: const EdgeInsets.only(top: 13, bottom: 13),
          child: Text(
            date,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isClassUnavailable ? Colors.grey[500] : Colors.indigo),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.withAlpha(50))),
          minimumSize: Size.fromHeight(45),
          textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          foregroundColor: Colors.indigo,
          backgroundColor: isClassUnavailable ? Colors.grey[300] : Colors.white,
        ));
  }

  void _showReviewsDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ReviewDialog(
              userId: widget.userId,
            ));
  }

  Widget _buildTutorWidget(BuildContext context, Tutor? tutor) {
    var country = Countries.byCodeOrName(
        tutor?.country ?? tutor?.user?.country ?? 'VN',
        tutor?.country ?? tutor?.user?.country ?? 'Vietnam');

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(900.0),
            child: Image.network(
              tutor?.avatar ??
                  tutor?.user?.avatar ??
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
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tutor?.name ?? tutor?.user?.name ?? 'N/A',
                  style: FlutterFlowTheme.of(context).title3,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
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
                  rating: tutor?.rating ?? 0,
                  unratedColor: Color(0xFF9E9E9E),
                  itemCount: 5,
                  itemSize: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTutorInteraction(BuildContext context, Tutor? tutor) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: InteractionButton(
                onPressed: _favorite,
                unselectedIconUrl:
                    'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsrounded/favorite/default/48px.svg',
                selectedIconUrl:
                    'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsrounded/favorite/fill1/48px.svg',
                isSelected: tutor?.isFavoriteTutor ?? false,
                name: 'Favorite',
                color: tutor?.isFavoriteTutor ?? false
                    ? Colors.pinkAccent.withAlpha(200)
                    : FlutterFlowTheme.of(context).primaryColor),
          ),
          VerticalDivider(color: Colors.black12),
          Expanded(
            child: InteractionButton(
                onPressed: _showReviewsDialog,
                unselectedIconUrl:
                    'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsrounded/star/default/48px.svg',
                selectedIconUrl:
                    'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsrounded/star/default/48px.svg',
                isSelected: false,
                name: 'Reviews'),
          ),
          VerticalDivider(color: Colors.black12),
          Expanded(
            child: InteractionButton(
                onPressed: _showReportDialog,
                unselectedIconUrl:
                    'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsrounded/report/default/48px.svg',
                selectedIconUrl:
                    'https://fonts.gstatic.com/s/i/short-term/release/materialsymbolsrounded/report/default/48px.svg',
                isSelected: false,
                name: 'Report',
                color: Colors.red.shade500),
          ),
        ],
      ),
    );
  }

  void _favorite() async {
    var response = (await ApiService().favorite(widget.userId));
    setState(() {
      tutor!.isFavoriteTutor = response == true;
    });
  }

  void _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ReportDialog(
          username: tutor?.name ?? '',
          userId: widget.userId,
        ));
  }
}

class InteractionButton extends StatelessWidget {
  const InteractionButton(
      {Key? key,
      required this.onPressed,
      required this.unselectedIconUrl,
      required this.selectedIconUrl,
      required this.isSelected,
      required this.name,
      this.color})
      : super(key: key);

  final String unselectedIconUrl;
  final String selectedIconUrl;
  final bool isSelected;
  final String name;
  final VoidCallback onPressed;
  final Color? color;

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
            colorFilter: ColorFilter.mode(
                color ?? FlutterFlowTheme.of(context).primaryColor,
                BlendMode.srcIn),
            width: 26,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: FlutterFlowTheme.of(context).title1Family,
                fontSize: 15,
                color: color ?? FlutterFlowTheme.of(context).primaryColor),
          ),
        ]));
  }
}

class CourseWidget extends StatelessWidget {
  const CourseWidget({Key? key, this.title = 'N/A'}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Color(0xFFE3E3E3),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontSize: 16.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: OutlinedButton(
                    onPressed: () {
                      //MyApp.To(context, CourseDetailsPageWidget(null));
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.indigo,
                      side: BorderSide(color: Color(0xFFd3d3d3), width: 1),
                    ),
                    child: Icon(Icons.arrow_forward,
                        size: 20.0, color: Colors.indigo),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
