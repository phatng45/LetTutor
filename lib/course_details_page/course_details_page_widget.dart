import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/models/class_schedule_status_widget.dart';

import 'course_details_page_model.dart';

export 'course_details_page_model.dart';

class CourseDetailsPageWidget extends StatefulWidget {
  const CourseDetailsPageWidget({Key? key}) : super(key: key);

  @override
  _CourseDetailsPageWidgetState createState() =>
      _CourseDetailsPageWidgetState();
}

class _CourseDetailsPageWidgetState extends State<CourseDetailsPageWidget> {
  late CourseDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseDetailsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  final String whyTakeDescription =
      'Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.';

  final String whatLearnDescription =
      'You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.';

  var experienceLevelDescription = 'Intermediate';
  var coursesLengthDescription = '9 topics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: FlutterFlowTheme.of(context).primaryColor,
          iconTheme: IconThemeData(color: Colors.indigo),
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.white,
          title: const Text('Courses'),
          titleTextStyle: FlutterFlowTheme.of(context).title1.override(
              fontFamily: FlutterFlowTheme.of(context).title1Family,
              color: Colors.indigo),
        ),
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network('https://picsum.photos/seed/437/600',
                    height: 250, width: 1000, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Life in the Internet Age',
                            style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).title1Family,
                                // fontWeight: FontWeight.w500,
                                color: Colors.indigo)),
                        Text(
                          'Let\'s discuss how technology is changing the way we live',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 3.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12)),
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.signal_cellular_alt_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        Text(experienceLevelDescription,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .title1Family,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                      ],
                                    ),
                                    VerticalDivider(
                                      width: 20,
                                      thickness: 1,
                                      indent: 5,
                                      endIndent: 5,
                                      color: Colors.black12,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.schedule_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        Text(coursesLengthDescription,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .title1Family,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        //   child: SizedBox(
                        //     width: double.infinity,
                        //     child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         minimumSize: Size.fromHeight(40),
                        //         side: BorderSide(
                        //             width: 1.0, color: Colors.black12),
                        //         textStyle: FlutterFlowTheme.of(context)
                        //             .bodyText1
                        //             .override(
                        //                 fontFamily: FlutterFlowTheme.of(context)
                        //                     .bodyText1Family,
                        //                 fontSize: 15,
                        //                 fontWeight: FontWeight.w500),
                        //         foregroundColor: Colors.white,
                        //         backgroundColor: Colors.indigo,
                        //       ),
                        //       onPressed: () {},
                        //       child: Text('Discover Course'),
                        //     ),
                        //   ),
                        // ),
                        Text('Overview',
                            style: FlutterFlowTheme.of(context).title2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                              child: Icon(
                                Icons.help_outline_outlined,
                                color: Colors.indigo,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Why take this course',
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .title1Family,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Text(whyTakeDescription,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                              child: Icon(
                                Icons.help_outline_outlined,
                                color: Colors.indigo,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'What will you be able to do',
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .title1Family,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Text(whatLearnDescription,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text('Topics',
                            style: FlutterFlowTheme.of(context).title2),
                        TopicButton('1. The Internet'),
                        TopicButton('2. Artificial Intelligence (AI)'),
                        TopicButton('3. Social Media'),
                        TopicButton('4. Internet Privacy'),
                        TopicButton('5. Live Streaming'),
                        TopicButton('6. Coding'),
                        TopicButton('7. Technology Transforming Healthcare'),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}

class TopicButton extends StatelessWidget {
  const TopicButton(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black.withAlpha(10))),
                minimumSize: Size.fromHeight(45),
                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                foregroundColor: Colors.indigo,
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child:
                  Align(alignment: Alignment.centerLeft, child: Text(title)))),
    );
  }
}

class CourseGeneralInfo extends StatelessWidget {
  const CourseGeneralInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
              spreadRadius: 2.0,
            )
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network('https://picsum.photos/seed/437/600',
                  height: 250, width: 1000, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Life in the Internet Age',
                      style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: FlutterFlowTheme.of(context).title1Family,
                          // fontWeight: FontWeight.w500,
                          color: Colors.indigo)),
                  Text(
                    'Let\'s discuss how technology is changing the way we live' +
                        '\n',
                    style: FlutterFlowTheme.of(context).bodyText1,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Intermediate • 9 Lessons',
                            style: FlutterFlowTheme.of(context).subtitle1),
                        PositiveButton(
                            title: 'Discover',
                            icon: Icon(
                              Icons.public,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
