import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class MyChip extends StatelessWidget {
  const MyChip({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      side: BorderSide(color: Colors.transparent),
      label: Text(data),
      backgroundColor: Color(0xFFBCE8FF),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
      labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
        color: Color(0xFF2767FF),
      ),
    );
  }
}
