import 'package:flutter/material.dart';
import 'package:let_tutor/components/best_divider_widget.dart';
import 'package:let_tutor/components/class_review_status_widget.dart';
import 'package:let_tutor/components/tutor_general_info_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

import '../courses_page/courses_page_widget.dart';
import 'history_page_model.dart';

export 'history_page_model.dart';

class HistoryPageWidget extends StatefulWidget {
  const HistoryPageWidget({Key? key}) : super(key: key);

  @override
  _HistoryPageWidgetState createState() => _HistoryPageWidgetState();
}

class _HistoryPageWidgetState extends State<HistoryPageWidget> {
  late HistoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryPageModel());
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
        title: 'History',
        body: SliverToBoxAdapter(
            child: SingleChildScrollView(
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
                          ClassReviewStatus(),
                          ClassReviewStatus(),
                          ClassReviewStatus(),
                          ClassReviewStatus(),
                          ClassReviewStatus(),
                          ClassReviewStatus(),
                          ClassReviewStatus(),
                          ClassReviewStatus(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
