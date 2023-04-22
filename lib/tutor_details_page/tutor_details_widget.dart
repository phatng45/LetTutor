import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/components/tutor_general_info_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_video_player.dart';
import 'package:let_tutor/models/tutor.dart';

import '../components/my_chip.dart';
import '../components/tutor_specialties_widget.dart';
import '../schedule_page/schedule_page_widget.dart';
import 'tutor_details_model.dart';

export 'tutor_details_model.dart';

class TutorDetailsPageWidget extends StatefulWidget {
  const TutorDetailsPageWidget(this.tutor, {Key? key}) : super(key: key);

  final Tutor tutor;

  @override
  _TutorDetailsPageWidgetState createState() => _TutorDetailsPageWidgetState();
}

class _TutorDetailsPageWidgetState extends State<TutorDetailsPageWidget> {
  late TutorDetailsPageModel _model;
  late Tutor tutor = widget.tutor;
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
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabHeader(
                title: tutor.name ?? '',
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TutorGeneralInfoWidget(
                        hasRating: true,
                        context: context,
                        tutor: widget.tutor,
                      ),
                    ),
                    Text(
                      widget.tutor.bio!,
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
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.person_add_rounded),
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
                    MyChip(data: tutor.country ?? ''),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black12,
                    ),
                    Text(
                      'Specialties',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    TutorSpecialtiesWidget(specialties: tutor.specialties),
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
                          path: tutor.video ?? '',
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
                      tutor.experience ?? 'N/A',
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
                      tutor.interests ?? 'N/A',
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
                      itemCount: tutor.feedbacks!.length,
                      itemBuilder: (context, index) {
                        final feedback = tutor.feedbacks![index];
                        return Text(feedback.content!);
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
}

class CourseWidget extends StatelessWidget {
  const CourseWidget({Key? key, this.title = ''}) : super(key: key);

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
