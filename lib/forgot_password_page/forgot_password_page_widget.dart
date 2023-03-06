import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_widgets.dart';

import 'forgot_password_page_model.dart';

export 'forgot_password_page_model.dart';

class ForgotPasswordPageWidget extends StatefulWidget {
  const ForgotPasswordPageWidget({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageWidgetState createState() =>
      _ForgotPasswordPageWidgetState();
}

class _ForgotPasswordPageWidgetState extends State<ForgotPasswordPageWidget> {
  late ForgotPasswordPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primaryBackground,
                  FlutterFlowTheme.of(context).secondaryBackground
                ],
                stops: [0.0, 0.5],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                              spreadRadius: 2.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'data:image/png;base64,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',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'LetTutor',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Open Sans',
                              color: Color(0xFF2F65E3),
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                          spreadRadius: 5.0,
                        )
                      ],
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
                                  'Forgot Password?',
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
                                  child: Text(
                                    'Provide your account\'s email for which you want to reset password.',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
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
                                      0.0, 10.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.textFieldModel,
                                    updateCallback: () => setState(() {}),
                                    child: TextFieldWidget(
                                      fieldName: 'Email',
                                      icon: Icon(
                                        Icons.email_outlined,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('buttonForgotPassword pressed ...');
                                    },
                                    text: 'Continue',
                                    options: FFButtonOptions(
                                      width: 200.0,
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
