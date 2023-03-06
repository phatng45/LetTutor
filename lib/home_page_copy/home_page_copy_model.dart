// import '/backend/backend.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_model.dart';

import 'package:let_tutor/components/tutor_specialties_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
