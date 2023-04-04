import 'package:flutter/material.dart';
import 'package:let_tutor/components/best_divider_widget.dart';
import 'package:let_tutor/components/password_field_widget.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

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
