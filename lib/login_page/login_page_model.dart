import '/components/best_divider_widget.dart';
import '/components/password_field_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for TextField component.
  late TextFieldModel textFieldModel;
  // Model for PasswordField component.
  late PasswordFieldModel passwordFieldModel;
  // Model for BestDivider component.
  late BestDividerModel bestDividerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    passwordFieldModel = createModel(context, () => PasswordFieldModel());
    bestDividerModel = createModel(context, () => BestDividerModel());
  }

  void dispose() {
    textFieldModel.dispose();
    passwordFieldModel.dispose();
    bestDividerModel.dispose();
  }

  /// Additional helper methods are added here.

}
