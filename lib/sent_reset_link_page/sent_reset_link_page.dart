import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/login_page/login_page_widget.dart';
import 'package:let_tutor/main.dart';

import '../flutter_flow/flutter_flow_widgets.dart';

export '../forgot_password_page/forgot_password_page_model.dart';

class SentResetLinkPage extends StatelessWidget {
  const SentResetLinkPage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: SafeArea(
          child:LetTutorIconAndTitle(child:
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 0.0, 0.0),
                        child: Text(
                          'Check your email',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child:

                          RichText(
                            text: TextSpan(
                              text:  'We just sent you a reset password link over to ',
                              style:   FlutterFlowTheme.of(context).subtitle2,
                              children:  <TextSpan>[
                                TextSpan(text: email, style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '\nPlease login again once you have reset your password from there.'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 10.0, 0.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: () => MyApp.To(context, LoginPageWidget()),
                        text: 'Back to Login',
                        options: FFButtonOptions(
                          width: 180.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding:
                          EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context)
                              .primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                            fontFamily:
                            FlutterFlowTheme.of(context)
                                .subtitle2Family,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey(
                                FlutterFlowTheme.of(context)
                                    .subtitle2Family),
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
            ,)
      ),
    );
  }
}