import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor/components/class_schedule_status_widget.dart';
import 'package:let_tutor/course_details_page/course_details_page_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

import '../api/api_service.dart';
import '../main.dart';
import '../models/course.dart';
import '../schedule_page/schedule_page_widget.dart';
import 'courses_page_model.dart';

export 'courses_page_model.dart';

class CoursesPageWidget extends StatefulWidget {
  const CoursesPageWidget({Key? key}) : super(key: key);

  @override
  _CoursesPageWidgetState createState() => _CoursesPageWidgetState();
}

class _CoursesPageWidgetState extends State<CoursesPageWidget> {
  late CoursesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Course> _listCourse = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesPageModel());
    _getData();
  }

  void _getData() async {
    _listCourse = (await ApiService().coursePagination(10, 1))!;
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => setState(() {}));
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TabHeader(title: 'Courses'.tr),
                _listCourse.isEmpty
                    ? const Align(
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          ListView.builder(
                            clipBehavior: Clip.none,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _listCourse.length,
                            itemBuilder: (context, index) {
                              final course = _listCourse[index];
                              return _buildCourseInfo(context, course);
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCourseInfo(BuildContext context, Course course) {
    return Padding(
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
                return Image.asset('assets/icons/defaultCourseImg.png');
              }, height: 265, width: 1000, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name ?? 'N/A',
                      style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).title1Family,
                          // fontWeight: FontWeight.w500,
                          color: Colors.indigo)),
                  Text(
                    course.description ?? 'N/A',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontSize: 18),
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                              (course.levelString ?? 'N/A') +
                                  ' • ' +
                                  (course.topics?.length ?? 0).toString() +
                                  ' Lessons',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      color: Colors.black38,
                                      fontSize: 16)),
                        ),
                        Expanded(
                          flex: 2,
                          child: PositiveButton(
                            title: 'Discover'.tr,
                            icon: Icon(
                              Icons.public,
                              size: 20,
                            ),
                            onPressed: () {
                              MyApp.To(context, CourseDetailsPageWidget(course));
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverScaffold extends StatelessWidget {
  const SliverScaffold({
    Key? key,
    required this.scaffoldKey,
    required this.title,
    required this.body,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: 60.0,
            iconTheme: IconThemeData(color: Colors.indigo),
            backgroundColor: Color(0xfff0ecfc),
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: Alignment(-1, 1),
                child: Text(
                  title,
                  style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: FlutterFlowTheme.of(context).title1Family,
                      color: Colors.indigo,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          body,
        ]));
  }
}
