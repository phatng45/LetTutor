import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/models/user.dart';
import 'package:let_tutor/schedule_page/schedule_page_widget.dart';

import '../flutter_flow/flutter_flow_util.dart';

class UpdateInfoWidget extends StatefulWidget {
  const UpdateInfoWidget(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  State<UpdateInfoWidget> createState() => _UpdateInfoWidgetState();
}

class _UpdateInfoWidgetState extends State<UpdateInfoWidget> {
  final _formKey = GlobalKey<FormState>();
  late User user = widget.user;

  late TextEditingController _countryTextFieldController =
      new TextEditingController(
    text: user.country ?? '',
  );

  late TextEditingController _birthdayTextFieldController =
      new TextEditingController(
    text: user.birthday ?? '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TabHeader(
                title: 'Update Information',
                centerTitle: true,
                start: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.indigo,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Text(
                          '*',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Colors.red),
                        ),
                        Text('Name',
                            style: FlutterFlowTheme.of(context).bodyText1),
                      ],
                    ),
                    _nameField(context),
                    Row(
                      children: <Widget>[
                        Text(
                          '*',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Colors.red),
                        ),
                        Text('Country',
                            style: FlutterFlowTheme.of(context).bodyText1),
                      ],
                    ),
                    _countryField(context),
                    Text('Email Address',
                        style: FlutterFlowTheme.of(context).bodyText1),
                    _emailField(context),
                    Text('Phone Number',
                        style: FlutterFlowTheme.of(context).bodyText1),
                    _phoneField(context),
                    Text('Birthday',
                        style: FlutterFlowTheme.of(context).bodyText1),
                    _birthdayField(context),
                    Row(
                      children: <Widget>[
                        Text(
                          '*',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Colors.red),
                        ),
                        Text('Level',
                            style: FlutterFlowTheme.of(context).bodyText1),
                      ],
                    ),
                    _levelField(context),
                    Text('Study Schedule',
                        style: FlutterFlowTheme.of(context).bodyText1),
                    _scheduleField(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _scheduleField(BuildContext context) {
    return TextFormField(
      initialValue: user.studySchedule,
      style: FlutterFlowTheme.of(context).bodyText1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: 'Note the time of the week you want to study on LetTutor\n',
        hintMaxLines: 5,
        hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
            color: Colors.grey.shade400),
      ),
    );
  }

  GestureDetector _birthdayField(BuildContext context) {
    return GestureDetector(
      onTap: () => DatePicker.showDatePicker(context,
          showTitleActions: true,
          minTime: DateTime(1900, 1, 1),
          maxTime: DateTime(2100, 12, 31), onConfirm: (date) {
        setState(() {
          _birthdayTextFieldController.text =
              DateFormat('yyyy-MM-dd').format(date);
        });
      }, currentTime: DateTime.now()),
      child: TextFormField(
        controller: _birthdayTextFieldController,
        enabled: false,
        style: FlutterFlowTheme.of(context).bodyText1,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.calendar_today_outlined,
            size: 20,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ),
      ),
    );
  }

  TextFormField _phoneField(BuildContext context) {
    return TextFormField(
      initialValue: user.studySchedule,
      style: FlutterFlowTheme.of(context).bodyText1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      ),
    );
  }

  TextFormField _emailField(BuildContext context) {
    return TextFormField(
      enabled: false,
      initialValue: user.email,
      style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
          color: Colors.grey),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      ),
    );
  }

  GestureDetector _countryField(BuildContext context) {
    return GestureDetector(
      onTap: () => showCountryPicker(
          countryListTheme: CountryListThemeData(
            flagSize: 20,
            textStyle: FlutterFlowTheme.of(context).bodyText1,
            bottomSheetHeight: 500,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            inputDecoration: InputDecoration(),
          ),
          showSearch: false,
          context: context,
          onSelect: (value) {
            user.country = value.name;
            setState(() {
              _countryTextFieldController.text = user.country!;
            });
          }),
      child: TextFormField(
        controller: _countryTextFieldController,
        enabled: false,
        style: FlutterFlowTheme.of(context).bodyText1,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.language, size: 20),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ),
      ),
    );
  }

  TextFormField _nameField(BuildContext context) {
    return TextFormField(
        initialValue: user.name,
        style: FlutterFlowTheme.of(context).bodyText1,
        key: _formKey,
        onEditingComplete: () => _formKey.currentState!.validate(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.indigo,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Name must not be null.';
          }
          return null;
        });
  }

  String levelValue = levels.keys.first;

  static const Map<String, String> levels = {
    'Pre A1 (Beginner)': 'BEGINNER',
    'A1 (Higher Beginner)': 'HIGHER_BEGINNER',
    'A2 (Pre-Intermediate)': 'PRE_INTERMEDIATE',
    'B1 (Intermediate)': 'INTERMEDIATE',
    'B2 (Upper-Intermediate)': 'UPPER_INTERMEDIATE',
    'C1 (Advanced)': 'ADVANCED',
    'C2 (Proficiency)': 'PROFICIENCY',
  };

  _levelField(BuildContext context) {
    return DropdownButtonFormField(
      value: levelValue,
      icon: const Icon(Icons.expand_more),
      elevation: 16,
      style: FlutterFlowTheme.of(context).bodyText1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          levelValue = value!;
        });
      },
      items: levels.keys.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
