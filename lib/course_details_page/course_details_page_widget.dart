import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/index.dart';
import 'package:let_tutor/main.dart';
import 'package:let_tutor/models/course.dart';
import 'package:let_tutor/schedule_page/schedule_page_widget.dart';

import 'course_details_page_model.dart';

export 'course_details_page_model.dart';

class CourseDetailsPageWidget extends StatefulWidget {
  CourseDetailsPageWidget(this.course, {Key? key}) : super(key: key);

  Course course;

  @override
  _CourseDetailsPageWidgetState createState() =>
      _CourseDetailsPageWidgetState();
}

class _CourseDetailsPageWidgetState extends State<CourseDetailsPageWidget> {
  late CourseDetailsPageModel _model;
  late Course course = widget.course;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TabHeader(
                  title: 'Course',
                  start: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.indigo,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 1.0),
                          spreadRadius: 0,
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
                          child: Image.network(course.imageUrl!,
                              errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                                'assets/icons/defaultCourseImg.png');
                          }, height: 275, width: 1000, fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(course.name ?? 'N/A',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .title1Family,
                                          // fontWeight: FontWeight.w500,
                                          color: Colors.indigo)),
                              Text(
                                course.description ?? 'N/A',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontSize: 18),
                                maxLines: 2,
                              ),
                              //Divider(indent: 8,endIndent: 8, color: Colors.black12,),

                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: <Widget>[
                                            Icon(
                                              Icons.signal_cellular_alt_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            Text(course.levelString!,
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                      ),
                                      VerticalDivider(
                                        width: 20,
                                        thickness: 1.5,
                                        indent: 5,
                                        endIndent: 5,
                                        color: Colors.black12,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: <Widget>[
                                            Icon(
                                              Icons.schedule_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            Text(
                                                (course.topics?.length ?? 0)
                                                        .toString() +
                                                    ' topics',
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.help_outline_outlined,
                              // weight: 500,
                              color: Colors.red.shade400,
                              size: 22,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Why take this course',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ],
                        ),
                        Text(course.reason ?? 'N/A',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context).bodyText1),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.help_outline_outlined,
                              // weight: 500,
                              color: Colors.red.shade400,
                              size: 22,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'What will you be able to do',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ],
                        ),
                        Text(course.purpose ?? 'N/A',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context).bodyText1),
                        Divider(
                            indent: 10, endIndent: 10, color: Colors.black12),
                        Text('Topics',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title1Family,
                                  fontSize: 30.0,
                                )),
                        GridView.builder(
                          clipBehavior: Clip.none,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: course.topics!.length,
                          itemBuilder: (context, index) {
                            final topic = course.topics![index];
                            return _buildTopicButton(
                              (index + 1).toString() +
                                  '. ' +
                                  (topic.name ?? 'N/A'),
                              () => MyApp.To(context, PdfPageWidget(topic.nameFile!, topic.name ?? 'N/A')),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (2 / 1),
                                crossAxisSpacing: 7,
                                mainAxisSpacing: 5,
                          ),
                        ),
                  SizedBox(height: 50)    ]),

                )
              ],
            ),
          ),
        )));
  }

  Widget _buildTopicButton(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
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
                backgroundColor: Colors.grey.withAlpha(10),
              ),
              onPressed: onPressed,
              child:
                  Align(alignment: Alignment.centerLeft, child: Text(title)))),
    );
  }
}
