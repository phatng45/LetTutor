import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

import '../api/api_service.dart';
import '../components/best_divider_widget.dart';
import '../components/class_schedule_status_widget.dart';
import '../components/tutor_general_info_widget.dart';
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
                _schedules.isEmpty
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: isLoading
                            ? _buildProgressIndicator()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Center(
                                    child: Text('You haven\'t booked any class.',
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
    return
    Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration:          BoxDecoration(
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TutorGeneralInfoWidget(
                hasRating: false,
                context: context,
                tutor: book.scheduleDetailInfo?.scheduleInfo?.tutorInfo ?? null,
              ),
              BestDividerWidget(
                title: '',
              ),
              ClassScheduleStatus(),
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
