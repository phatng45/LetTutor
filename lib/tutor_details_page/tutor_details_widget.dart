import 'package:another_flushbar/flushbar.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country/countries.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_video_player.dart';
import 'package:let_tutor/models/tutor.dart';
import 'package:let_tutor/models/tutor_schedule.dart';

import '../api/api_service.dart';
import '../components/my_chip.dart';
import '../components/tutor_specialties_widget.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../schedule_page/schedule_page_widget.dart';
import 'tutor_details_model.dart';

export 'tutor_details_model.dart';

class TutorDetailsPageWidget extends StatefulWidget {
  const TutorDetailsPageWidget(this.tutorId, {Key? key}) : super(key: key);

  final String tutorId;

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

    _getTutorById(widget.tutorId);
    _getScheduleById(widget.tutorId);
    _model = createModel(context, () => TutorDetailsPageModel());
    _model.textController ??= TextEditingController();
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
                title: tutor?.name ?? 'N/A',
                centerTitle: true,
                start: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.indigo,
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
                    color: Color(0x98E4E4E4),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tutor?.name ?? tutor?.user?.name ?? 'N/A',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: CountryFlags.flag(
                                            (country.alpha2Code ?? 'vn')
                                                .toLowerCase(),
                                            height: 22,
                                            width: 22,
                                            // borderRadius: 8,
                                          ),
                                        ),
                                        Text(
                                          country.name ?? 'Vietnam',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
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
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: ToggleIcon(
                                    onPressed: () {
                                      setState(() {
                                        if (tutor != null) {
                                          tutor!.isFavorited =
                                              !tutor!.isFavorited;
                                        }
                                      });
                                    },
                                    value: tutor?.isFavorited ?? false,
                                    onIcon: Icon(
                                      Icons.favorite_border,
                                      color: Color(0xFFFF5686),
                                      size: 25.0,
                                    ),
                                    offIcon: Icon(
                                      Icons.favorite_rounded,
                                      color: Color(0xFFFF5686),
                                      size: 25.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      tutor?.bio ?? 'N/A',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                    // Align(
                    //   alignment: AlignmentDirectional(-1.0, 0.0),
                    //   child:
                    // ),

                    // SizedBox(height: 50, width: double.maxFinite,child: PositiveButton(title: 'Book', onPressed: (){}, icon:  Icon(Icons.person_add_rounded, color: Colors.white) ))
                    // ,

                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black12,
                    ),
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
                      child: Center(
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
                    RatingBarIndicator(
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFCA77),
                      ),
                      direction: Axis.horizontal,
                      rating: 2.0,
                      unratedColor: Color(0xFF9E9E9E),
                      itemCount: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextFieldWidget(
                        fieldName: 'Write a review',
                        icon: Icon(Icons.email_outlined),
                      ),
                    ),
                    ListView.builder(
                      clipBehavior: Clip.none,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tutor?.feedbacks?.length ?? 0,
                      itemBuilder: (context, index) {
                        final feedback = tutor?.feedbacks?[index] ?? null;
                        return Text(feedback?.content ?? 'N/A');
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

    print("finished");
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
                          ? Text('Oops, there are nothing here.',
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
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Flushbar(
                      title: "Booked Successfully!",
                      message: '',
                      duration: Duration(seconds: 1, milliseconds: 500),
                      borderRadius: BorderRadius.circular(20),
                      margin: EdgeInsets.all(10),
                      flushbarStyle: FlushbarStyle.FLOATING,
                      backgroundColor: Colors.grey.shade200,
                      messageColor: Colors.indigo,
                      titleColor: Colors.indigo,
                    )..show(context);
                  }
                  else{
                    Flushbar(
                      title: "Book Failed.",
                      message: 'Please try again later',
                      duration: Duration(seconds: 2, milliseconds: 500),
                      borderRadius: BorderRadius.circular(20),
                      margin: EdgeInsets.all(10),
                      flushbarStyle: FlushbarStyle.FLOATING,
                      backgroundColor: Colors.red.shade100,
                      messageColor: Colors.red.shade700,
                      titleColor: Colors.red.shade700,
                    )..show(context);
                  }
              },
        child: Container(
          padding: const EdgeInsets.only(top: 13, bottom: 13),
          child: Text(
            date,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.indigo),
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
          backgroundColor:
              isClassUnavailable ? Colors.grey[300] : Colors.white,
        ));
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
