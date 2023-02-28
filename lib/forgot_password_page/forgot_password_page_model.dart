import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
