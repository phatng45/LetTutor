import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'best_divider_model.dart';
export 'best_divider_model.dart';

class BestDividerWidget extends StatefulWidget {
  const BestDividerWidget({Key? key}) : super(key: key);

  @override
  _BestDividerWidgetState createState() => _BestDividerWidgetState();
}

class _BestDividerWidgetState extends State<BestDividerWidget> {
  late BestDividerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BestDividerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  thickness: 1.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              'OR',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
