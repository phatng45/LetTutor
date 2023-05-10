import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';

import 'text_field_model.dart';

export 'text_field_model.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.fieldName,
    this.icon,
  }) : super(key: key);

  final String? fieldName;
  final Widget? icon;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: TextFormField(
        controller: _model.textController,
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          labelText: widget.fieldName,
          labelStyle: FlutterFlowTheme.of(context).bodyText1,
          hintStyle: FlutterFlowTheme.of(context).bodyText2,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).secondaryText,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          prefixIcon: widget.icon,
        ),
        style: FlutterFlowTheme.of(context).bodyText1,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
