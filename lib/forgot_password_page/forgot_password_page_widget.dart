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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                          child:  Image.asset(
                            'assets/images/logo.png',
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
