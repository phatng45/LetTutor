import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_tutor/backend/backend.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/components/tutor_general_info_widget.dart';
import 'package:let_tutor/components/tutor_specialties_widget.dart';
import 'package:let_tutor/course_details_page/course_details_page_widget.dart';
import 'package:let_tutor/courses_page/courses_page_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_choice_chips.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_video_player.dart';
import 'package:let_tutor/main.dart';

import 'tutor_details_model.dart';

export 'tutor_details_model.dart';

class TutorDetailsPageWidget extends StatefulWidget {
  const TutorDetailsPageWidget({Key? key}) : super(key: key);

  @override
  _TutorDetailsPageWidgetState createState() => _TutorDetailsPageWidgetState();
}

class _TutorDetailsPageWidgetState extends State<TutorDetailsPageWidget> {
  late TutorDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
    return SliverScaffold(
      scaffoldKey: scaffoldKey,
      title: 'Tutor',
      body: SliverToBoxAdapter(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TutorGeneralInfoWidget(hasRating: true),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Color(0xFFE3E3E3),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Language',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowChoiceChips(
                                            options: [ChipData('English')],
                                            onChanged: (val) => setState(() =>
                                                _model.choiceChipsValue =
                                                    val?.first),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0xFFBCE8FF),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            Color(0xFF2767FF),
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                              iconColor: Colors.white,
                                              iconSize: 18.0,
                                              elevation: 0.0,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0xFFE1E1E1),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2Family,
                                                        color:
                                                            Color(0xFF8C8C8C),
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2Family),
                                                      ),
                                              iconColor: Color(0xFFE3E7ED),
                                              iconSize: 18.0,
                                              elevation: 0.0,
                                            ),
                                            chipSpacing: 20.0,
                                            multiselect: false,
                                            alignment: WrapAlignment.start,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 100.0,
                                  child: VerticalDivider(
                                    thickness: 1.0,
                                    indent: 10.0,
                                    endIndent: 10.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Specialties',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child:
                                              StreamBuilder<List<TutorsRecord>>(
                                            stream: queryTutorsRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<TutorsRecord>
                                                  tutorSpecialtiesTutorsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final tutorSpecialtiesTutorsRecord =
                                                  tutorSpecialtiesTutorsRecordList
                                                          .isNotEmpty
                                                      ? tutorSpecialtiesTutorsRecordList
                                                          .first
                                                      : null;
                                              return wrapWithModel(
                                                model: _model
                                                    .tutorSpecialtiesModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: TutorSpecialtiesWidget(
                                                  specialties:
                                                      tutorSpecialtiesTutorsRecord!
                                                          .specialties!
                                                          .toList(),
                                                ),
                                              );
                                            },
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
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 250.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Color(0xFFE3E3E3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Introduction',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: FlutterFlowVideoPlayer(
                                      path:
                                          'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                      videoType: VideoType.network,
                                      autoPlay: false,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Courses',
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                CourseWidget(
                                  title: 'Basic Conversation Topics',
                                ),
                                CourseWidget(
                                  title: 'Life In The Internet Ages',
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Teaching Experiences',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                            ),
                            Padding(
                              // padding: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Text(
                                'I I have more than 10 years of teaching english experience',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontSize: 16.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Interests',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                            ),
                            Padding(
                              // padding: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Text(
                                'I love the weather, the scenery and the laid-back lifestyle of the locals.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontSize: 16.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Reviews',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title1Family,
                                        fontSize: 30.0,
                                      ),
                                ),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CourseWidget extends StatelessWidget {
  const CourseWidget({Key? key,  this.title =''}) : super(key: key);

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
                      MyApp.To(context, CourseDetailsPageWidget());
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
