import 'package:flutter/material.dart';
import 'package:let_tutor/components/best_divider_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/models/class_status_widget.dart';
import 'package:let_tutor/models/tutor_general_info_widget.dart';

import 'schedule_page_model.dart';

export 'schedule_page_model.dart';

class SchedulePageWidget extends StatefulWidget {
  const SchedulePageWidget({Key? key}) : super(key: key);

  @override
  _SchedulePageWidgetState createState() => _SchedulePageWidgetState();
}

class _SchedulePageWidgetState extends State<SchedulePageWidget> {
  late SchedulePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SchedulePageModel());
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
          title: const Text('Schedule'),
          titleTextStyle: FlutterFlowTheme.of(context).title1.override(
              fontFamily: FlutterFlowTheme.of(context).title1Family,
              color: Colors.indigo),
        ),
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TutorGeneralInfoWidget(hasRating: false),
                          BestDividerWidget(
                            title: '',
                          ),
                          ClassStatus()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

