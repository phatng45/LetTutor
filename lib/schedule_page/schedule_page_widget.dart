import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

import '../api/api_service.dart';
import '../components/class_schedule_status_widget.dart';
import '../main.dart';
import '../meeting_page/meeting_page_widget.dart';
import '../models/tutor.dart';
import '../models/tutor_schedule.dart';
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
  int page = 1;
  final int perPage = 10;
  List<BookingInfo> _schedules = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SchedulePageModel());
    _getScheduleData();
  }

  void _getScheduleData() async {
    setState(() {
      isLoading = true;
    });

    var schedules = (await ApiService.getSchedule(page, perPage))!;
    if (mounted)
      setState(() {
        page++;
        isLoading = false;
        this._schedules = schedules;
      });
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
        // title: 'Schedule',
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TabHeader(
                  title: 'Schedule',
                  end: IconButton(
                    icon: SizedBox(
                      width: 25,
                      height: 25,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/9297/9297236.png',
                        colorBlendMode: BlendMode.srcIn,
                        color: Colors.indigo,
                      ),
                    ),
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),

                    // style: IconButton.styleFrom(
                    //   backgroundColor: Colors.white,
                    //   padding: EdgeInsets.zero,
                    // ),

                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _schedules.isEmpty
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: isLoading
                              ? _buildProgressIndicator()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Center(
                                      child: Text(
                                          'You haven\'t booked any class.',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1)),
                                ),
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _schedules.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _schedules.length) {
                              return _buildProgressIndicator();
                            } else {
                              final tutor = _schedules[index];
                              return _buildScheduleWidget(context, tutor);
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleWidget(BuildContext context, BookingInfo book) {
    final Tutor? tutor =
        book.scheduleDetailInfo?.scheduleInfo?.tutorInfo ?? null;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
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
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      DateFormat.yMEd().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              book.scheduleDetailInfo
                                                      ?.startPeriodTimestamp ??
                                                  0)),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1),
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      DateFormat.Hm().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              book.scheduleDetailInfo
                                                      ?.startPeriodTimestamp ??
                                                  0)),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color: Colors.blue,
                                              fontSize: 10),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 1),
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                  Text(
                                    "-",
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family,
                                            fontSize: 10),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      DateFormat.Hm().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              book.scheduleDetailInfo
                                                      ?.endPeriodTimestamp ??
                                                  0)),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color: Colors.orange,
                                              fontSize: 10),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.orange, width: 1),
                                        color: Colors.orange[50],
                                        borderRadius: BorderRadius.circular(4)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NegativeButton(
                    title: 'Cancel',
                    onPressed: () {},
                  ),
                  PositiveButton(
                    title: 'Join meeting',
                    icon: null,
                    onPressed: () {
                      MyApp.To(context, MeetingPageWidget());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabHeader extends StatelessWidget {
  TabHeader(
      {Key? key,
      required this.title,
      this.end,
      this.start,
      this.centerTitle = false})
      : super(key: key);

  final String title;
  final Widget? end;
  final Widget? start;
  bool? centerTitle = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(start == null ? 30 : 0, 10, 30, 0),
      child: centerTitle == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    start ?? SizedBox.shrink(),
                    Text(title,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title1Family,
                              color: Colors.indigo,
                              fontSize: 25,
                            )),
                  ],
                ),
                end ?? SizedBox.shrink(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                start ?? SizedBox.shrink(),
                Text(title,
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: FlutterFlowTheme.of(context).title1Family,
                          color: Colors.indigo,
                          fontSize: 25,
                        )),
                end ?? SizedBox.shrink(),
              ],
            ),
    );
  }
}
