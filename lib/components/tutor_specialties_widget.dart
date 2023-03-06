import 'package:let_tutor/flutter_flow/flutter_flow_choice_chips.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tutor_specialties_model.dart';
export 'tutor_specialties_model.dart';

class TutorSpecialtiesWidget extends StatefulWidget {
  const TutorSpecialtiesWidget({
    Key? key,
    this.specialties,
  }) : super(key: key);

  final List<String>? specialties;

  @override
  _TutorSpecialtiesWidgetState createState() => _TutorSpecialtiesWidgetState();
}

class _TutorSpecialtiesWidgetState extends State<TutorSpecialtiesWidget> {
  late TutorSpecialtiesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TutorSpecialtiesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Wrap(
        spacing: 0.0,
        runSpacing: 0.0,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        verticalDirection: VerticalDirection.down,
        clipBehavior: Clip.none,
        children: [
          FlutterFlowChoiceChips(
            initiallySelected: widget.specialties,
            options:
                widget.specialties!.map((label) => ChipData(label)).toList(),
            onChanged: (val) => setState(() => _model.choiceChipsValues = val),
            selectedChipStyle: ChipStyle(
              backgroundColor: Color(0xFFBCE8FF),
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
              iconColor: Colors.white,
              iconSize: 18.0,
              elevation: 0.0,
            ),
            unselectedChipStyle: ChipStyle(
              backgroundColor: Color(0xFFE3E3E3),
              textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                    color: Color(0xFF8C8C8C),
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText2Family),
                  ),
              iconColor: Color(0xFFE3E7ED),
              iconSize: 18.0,
              elevation: 0.0,
            ),
            chipSpacing: 5.0,
            multiselect: true,
            initialized: _model.choiceChipsValues != null,
            alignment: WrapAlignment.start,
          ),
        ],
      ),
    );
  }
}
