import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/models/class_schedule_status_widget.dart';

import 'course_details_page_model.dart';

export 'course_details_page_model.dart';

class CourseDetailsPageWidget extends StatefulWidget {
  const CourseDetailsPageWidget({Key? key}) : super(key: key);

  @override
  _CourseDetailsPageWidgetState createState() => _CourseDetailsPageWidgetState();
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
          child: Column(
            children: [
              CourseGeneralInfo(),
              CourseGeneralInfo(),
              CourseGeneralInfo(),
              CourseGeneralInfo(),
              CourseGeneralInfo(),
            ],
          ),
        ));
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                child: Image.network(
                    'https://picsum.photos/seed/437/600',
                    height: 250,
                    width: 1000,
                    fit: BoxFit.cover),
              ),
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
                        'Let\'s discuss how technology is changing the way we live' + '\n',
                    style: FlutterFlowTheme.of(context).bodyText1,
                    maxLines: 2,),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Intermediate • 9 Lessons',
                              style: FlutterFlowTheme.of(context).subtitle1),
                          PositiveButton(title: 'Discover', icon: Icon(Icons.public,size: 20,))
                        ],
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
}
