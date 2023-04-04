import 'package:flutter/material.dart';
import 'package:let_tutor/courses_page/courses_page_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

import 'meeting_page_model.dart';

export 'meeting_page_model.dart';

class MeetingPageWidget extends StatefulWidget {
  const MeetingPageWidget({Key? key}) : super(key: key);

  @override
  _MeetingPageWidgetState createState() => _MeetingPageWidgetState();
}

class _MeetingPageWidgetState extends State<MeetingPageWidget> {
  late MeetingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeetingPageModel());
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
      title: 'Meeting',
      body: SliverToBoxAdapter(
          child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        color: Colors.grey,
      )),
    );
  }
}
