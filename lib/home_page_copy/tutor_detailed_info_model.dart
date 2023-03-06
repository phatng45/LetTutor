// import '/backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/components/tutor_specialties_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_model.dart';

class HomePageCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  // Model for tutorSpecialties component.
  late TutorSpecialtiesModel tutorSpecialtiesModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tutorSpecialtiesModel = createModel(context, () => TutorSpecialtiesModel());
  }

  void dispose() {
    tutorSpecialtiesModel.dispose();
  }

  /// Additional helper methods are added here.

}
