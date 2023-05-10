import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class MyChip extends StatefulWidget {
  MyChip({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
      child: RawChip(
        side: BorderSide(color: Colors.transparent),
        visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
        label: Text(
          widget.data,
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Color(0xFFBCE8FF),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200),
        ),
        labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              color: Color(0xFF2767FF),
            ),
        showCheckmark: false,
      ),
    );
  }
}
