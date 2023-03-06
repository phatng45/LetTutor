import 'package:flutter/material.dart';
import 'package:let_tutor/components/best_divider_widget.dart';
import 'package:let_tutor/components/password_field_widget.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

class SignUpPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for TextField component.
  late TextFieldModel textFieldModel;
  // Model for PasswordField component.
  late PasswordFieldModel passwordFieldModel1;
  // Model for PasswordField component.
  late PasswordFieldModel passwordFieldModel2;
  // Model for BestDivider component.
  late BestDividerModel bestDividerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    passwordFieldModel1 = createModel(context, () => PasswordFieldModel());
    passwordFieldModel2 = createModel(context, () => PasswordFieldModel());
    bestDividerModel = createModel(context, () => BestDividerModel());
  }

  void dispose() {
    textFieldModel.dispose();
    passwordFieldModel1.dispose();
    passwordFieldModel2.dispose();
    bestDividerModel.dispose();
  }

  /// Additional helper methods are added here.

}
