import 'package:flutter/material.dart';
import 'package:let_tutor/components/text_field_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

class ForgotPasswordPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for TextField component.
  late TextFieldModel textFieldModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
  }

  void dispose() {
    textFieldModel.dispose();
  }

  /// Additional helper methods are added here.

}
