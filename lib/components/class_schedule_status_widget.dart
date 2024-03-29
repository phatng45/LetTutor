import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';

class PositiveButton extends StatelessWidget {
  const PositiveButton(
      {Key? key,
      required this.title,
      this.icon,
      this.color,
      required this.onPressed})
      : super(key: key);

  final String title;
  final Icon? icon;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return icon == null ?
    ElevatedButton(
      style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.black12),
          textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          foregroundColor: Colors.white,
          backgroundColor: color ?? Colors.indigo,
          disabledBackgroundColor: Colors.black54,
          disabledForegroundColor: Colors.white),
      onPressed: onPressed,
      child: Text(title),
    ):

      ElevatedButton.icon(
      icon: icon!,
      style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.black12),
          textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          foregroundColor: Colors.white,
          backgroundColor: color ?? Colors.indigo,
          disabledBackgroundColor: Colors.black54,
          disabledForegroundColor: Colors.white),
      onPressed: onPressed,
      label: Text(title),
    );
  }
}

class NegativeButton extends StatelessWidget {
  const NegativeButton({
    Key? key,
    required this.title,
    this.onPressed
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: Colors.black12),
            textStyle: FlutterFlowTheme.of(context).bodyText1,
            foregroundColor: Colors.red,
            disabledForegroundColor: Colors.white,
            disabledBackgroundColor: Colors.black54
        ),
        onPressed: onPressed,
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
