import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';

class ClassScheduleStatus extends StatelessWidget {
  const ClassScheduleStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClassTime(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NegativeButton(
                title: 'Cancel',
              ),
              PositiveButton(
                title: 'Go to meeting',
                icon: Icon(Icons.people_rounded, size: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PositiveButton extends StatelessWidget {
  const PositiveButton({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.black12),
          textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo,
          disabledBackgroundColor: Colors.black54,
          disabledForegroundColor: Colors.white),
      onPressed: () {},
      label: Text(title),
    );
  }
}

class NegativeButton extends StatelessWidget {
  const NegativeButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: Colors.black12),
            textStyle: FlutterFlowTheme.of(context).bodyText1,
            foregroundColor: Colors.red,
            disabledForegroundColor: Colors.white,
            disabledBackgroundColor: Colors.black54),
        onPressed: () {},
        child: Text(title));
  }
}

class ClassTime extends StatelessWidget {
  const ClassTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fri, 30 Sep 2023',
          style: FlutterFlowTheme.of(context).title1,
        ),
        Text('18:30 - 18:55'),
      ],
    );
  }
}
