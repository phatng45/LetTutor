import '/backend/backend.dart';
import '/components/tutor_specialties_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

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
