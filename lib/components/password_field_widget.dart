import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'password_field_model.dart';
export 'password_field_model.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    Key? key,
    this.fieldName,
    this.icon,
  }) : super(key: key);

  final String? fieldName;
  final Widget? icon;

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  late PasswordFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordFieldModel());

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
        autofocus: true,
        obscureText: !_model.passwordVisibility,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          labelText: widget.fieldName,
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
              color: Color(0xFF757575),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF757575),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF757575),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          prefixIcon: widget.icon,
          suffixIcon: InkWell(
            onTap: () => setState(
              () => _model.passwordVisibility = !_model.passwordVisibility,
            ),
            focusNode: FocusNode(skipTraversal: true),
            child: Icon(
              _model.passwordVisibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Color(0xFF757575),
              size: 22.0,
            ),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyText1,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
