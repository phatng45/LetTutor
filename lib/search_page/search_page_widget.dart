import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class SearchPage extends StatelessWidget {
  final VoidCallback? onBackPressed;

  final TextEditingController controller = TextEditingController();

  SearchPage({Key? key, this.onBackPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 10, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                          onPressed: onBackPressed,
                          icon: Icon(Icons.chevron_left),
                      visualDensity: VisualDensity(horizontal: -4, vertical: 0),),
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            // isDense: true,
                            hintText: 'Find a tutor...',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFFE4E4E4),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
