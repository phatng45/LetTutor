import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';

class ClassStatus extends StatelessWidget {
  const ClassStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fri, 30 Sep 2023',
          style: FlutterFlowTheme.of(context).title1,
        ),
        Text('18:30 - 18:55'),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0,
                        color: Colors.black12),
                    textStyle:
                    FlutterFlowTheme.of(context)
                        .bodyText1,
                    foregroundColor: Colors.red,
                    disabledForegroundColor: Colors.white,
                    disabledBackgroundColor:
                    Colors.black54),
                onPressed: () {},
                child: const Text('Cancel')),
            ElevatedButton.icon(
              icon: Icon(
                Icons.people_rounded,
                size: 18,
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 1.0, color: Colors.black12),
                  textStyle: FlutterFlowTheme.of(context)
                      .bodyText1
                      .override(
                      fontFamily:
                      FlutterFlowTheme.of(context)
                          .bodyText1Family,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigo,
                  disabledBackgroundColor: Colors.black54,
                  disabledForegroundColor: Colors.white),
              onPressed: () {},
              label: const Text('Go to meeting'),
            ),
          ],
        )
      ],
    );
  }
}
