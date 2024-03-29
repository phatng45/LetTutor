import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:let_tutor/components/best_divider_widget.dart';
import 'package:let_tutor/components/password_field_widget.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_icon_button.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_widgets.dart';
import 'package:let_tutor/login_page/login_page_widget.dart';
import 'package:let_tutor/main.dart';

import '../api/api_service.dart';
import '../verify_page/verify_page.dart';
import 'sign_up_page_model.dart';

export 'sign_up_page_model.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({Key? key}) : super(key: key);

  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  late SignUpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpPageModel());
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
          child: LetTutorIconAndTitle(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Text(
                        'Hello, Friend!'.tr,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textFieldModel,
                          updateCallback: () => setState(() {}),
                          child: TextFieldWidget(
                            fieldName: 'Email'.tr,
                            icon: Icon(
                              Icons.mail_outline_rounded,
                              color: Colors.grey.shade400,
                            ),
                          ),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.passwordFieldModel1,
                          updateCallback: () => setState(() {}),
                          child: PasswordFieldWidget(
                            fieldName: 'Password'.tr,
                            icon: Icon(
                              Icons.lock_outlined,
                              color: Colors.grey.shade400,
                            ),
                          ),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.passwordFieldModel2,
                          updateCallback: () => setState(() {}),
                          child: PasswordFieldWidget(
                            fieldName: 'Confirm password'.tr,
                            icon: Icon(
                              Icons.lock_outlined,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () => _signup(
                              _model.textFieldModel.textController.text,
                              _model.passwordFieldModel1.textController.text),
                          text: 'Create Account'.tr,
                          options: FFButtonOptions(
                            width: 180.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
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
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.bestDividerModel,
                  updateCallback: () => setState(() {}),
                  child: BestDividerWidget(
                    title: 'OR'.tr,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 47.0,
                      icon: Icon(
                        Icons.mail_rounded,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 25.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 47.0,
                        icon: FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 25.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 47.0,
                      icon: Icon(
                        Icons.phone,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 25.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have your account?'.tr,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        foregroundColor:
                            FlutterFlowTheme.of(context).secondaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontSize: 16,
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle2Family,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      child: Text('Login'.tr),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _signup(String email, String password) async {
    var user = (await ApiService().register(email, password, context));
    if (user != null) {
      MyApp.To(
          context,
          VerifyPage(
            content: RichText(
              text: TextSpan(
                text: 'We just sent you a verify link over to ',
                style: FlutterFlowTheme.of(context).subtitle2,
                children: <TextSpan>[
                  TextSpan(
                      text: email,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                      '\nPlease login again once you have verified from there.'),
                ],
              ),
            ),
          ));
    }
  }
}
