import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:let_tutor/api/api_service.dart';
import 'package:let_tutor/components/class_schedule_status_widget.dart';
import 'package:let_tutor/components/copied_multi_select_chip_display.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/models/user.dart';
import 'package:let_tutor/schedule_page/schedule_page_widget.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../components/copied_multi_select_dialog_field.dart';
import '../flutter_flow/flutter_flow_util.dart';

class UpdateInfoWidget extends StatefulWidget {
  const UpdateInfoWidget(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  State<UpdateInfoWidget> createState() => _UpdateInfoWidgetState();
}

class _UpdateInfoWidgetState extends State<UpdateInfoWidget> {
  late User user = widget.user;

  late TextEditingController _nameTextFieldController =
      new TextEditingController(
    text: user.name ?? '',
  );

  late TextEditingController _countryTextFieldController =
      new TextEditingController(
    text: user.country ?? '',
  );

  late TextEditingController _phoneTextFieldController =
      new TextEditingController(
    text: user.phone ?? '',
  );

  late TextEditingController _birthdayTextFieldController =
      new TextEditingController(
    text: user.birthday ?? '',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TabHeader(
                title: 'Update Information'.tr,
                centerTitle: true,
                start: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: FlutterFlowTheme.of(context).primaryColor,
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
                          style: FlutterFlowTheme.of(context).title4.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title4Family,
                              color: Colors.red),
                        ),
                        Text('Name'.tr,
                            style: FlutterFlowTheme.of(context).title4),
                      ],
                    ),
                    _nameField(context),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Text(
                          '*',
                          style: FlutterFlowTheme.of(context).title4.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title4Family,
                              color: Colors.red),
                        ),
                        Text('Country'.tr,
                            style: FlutterFlowTheme.of(context).title4),
                      ],
                    ),
                    _countryField(context),
                    SizedBox(height: 6),
                    Text('Email Address'.tr,
                        style: FlutterFlowTheme.of(context).title4),
                    _emailField(context),
                    SizedBox(height: 6),
                    Text('Phone Number'.tr,
                        style: FlutterFlowTheme.of(context).title4),
                    _phoneField(context),
                    SizedBox(height: 6),
                    Text('Birthday',
                        style: FlutterFlowTheme.of(context).title4),
                    _birthdayField(context),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Text(
                          '*',
                          style: FlutterFlowTheme.of(context).title4.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title4Family,
                              color: Colors.red),
                        ),
                        Text('Level',
                            style: FlutterFlowTheme.of(context).title4),
                      ],
                    ),
                    _levelField(context),
                    SizedBox(height: 6),
                    Text('Want to learn',
                        style: FlutterFlowTheme.of(context).title4),
                    _wantToLearnField(context),
                    SizedBox(height: 6),
                    Text('Study Schedule'.tr,
                        style: FlutterFlowTheme.of(context).title4),
                    _scheduleField(context),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        PositiveButton(
                            title: 'Save changes'.tr,
                            onPressed: () {
                              _updateUserInfo();
                            }),
                      ],
                    ),
                    SizedBox(height: 100),
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
      autofocus: false,
      initialValue: user.studySchedule,
      style: FlutterFlowTheme.of(context).bodyText1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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
              color:
                  FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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
      controller: _phoneTextFieldController,
      style: FlutterFlowTheme.of(context).bodyText1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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
        fillColor: Get.rootController.themeMode == ThemeMode.dark
            ? Colors.grey.shade900
            : Colors.grey.shade200,
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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
              color:
                  FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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
        controller: _nameTextFieldController,
        style: FlutterFlowTheme.of(context).bodyText1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color:
                  FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color:
                  FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color:
                  FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color:
                  FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color:
                  FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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

  String levelValue = LevelToLevelId.keys.first;

  static const Map<String, String> LevelToLevelId = {
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
      icon: const Icon(
        Icons.expand_more,
        color: Colors.grey,
      ),
      elevation: 16,
      style: FlutterFlowTheme.of(context).bodyText1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
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
      items: LevelToLevelId.keys.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  late List<String> wantToLearn =
      user.learnTopics?.map((e) => e.name ?? '').toList() ?? []
        ..addAll(user.testPreparations?.map((e) => e.name ?? '') ?? []);

  static const Map<String, String> LearnTopicsToId = {
    'English for Kids': '3',
    'Business English': '4',
    'Conversational English': '5'
  };

  static const Map<String, String> TestPreparationsToId = {
    'STARTERS': '1',
    'MOVERS': '2',
    'FLYERS': '3',
    'KET': '4',
    'PET': '5',
    'IELTS': '6',
    'TOEFL': '7',
    'TOEIC': '8',
  };

  _wantToLearnField(BuildContext context) {
    return DefaultTextStyle.merge(
      style: FlutterFlowTheme.of(context).bodyText1,
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: FlutterFlowTheme.of(context).lineColor, // Color(0x98E4E4E4),
          ),
        ),
        child: MultiSelectDialogField(
          title: Text('Select'),
          buttonText: Text('Select Category'),
          cancelText: Text('Cancel'),
          confirmText: Text('Save'),
          initialValue: wantToLearn,
          listType: MultiSelectListType.CHIP,
          items: TestPreparationsToId.keys
              .map((e) => MultiSelectItem(e, e))
              .toList(),
          items2:
              LearnTopicsToId.keys.map((e) => MultiSelectItem(e, e)).toList(),
          chipDisplay: MultiSelectChipDisplay(
            chipColor: Color(0xFFBCE8FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
            textStyle: FlutterFlowTheme.of(context).bodyText1,
            items: wantToLearn.map((e) => MultiSelectItem(e, e)).toList(),
            onTap: (value) {
              setState(() {
                wantToLearn.remove(value);
              });
            },
          ),
          buttonIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          decoration: BoxDecoration(),
          searchHintStyle: FlutterFlowTheme.of(context).bodyText1,
          itemsTextStyle: FlutterFlowTheme.of(context).bodyText1,
          searchTextStyle: FlutterFlowTheme.of(context).bodyText1,
          selectedItemsTextStyle: FlutterFlowTheme.of(context).bodyText1,
          onConfirm: (List<dynamic> value) {
            setState(() {
              wantToLearn = value.map((e) => e as String).toList();
            });
          },
        ),
      ),
    );
  }

  void _updateUserInfo() async {
    String name = _nameTextFieldController.text;
    String country = _countryTextFieldController.text;
    String phone = _phoneTextFieldController.text;
    String birthday = _birthdayTextFieldController.text;
    String level = LevelToLevelId[levelValue] ?? '';
    List<String> learnTopics = wantToLearn
        .where((e) => LearnTopicsToId.keys.contains(e))
        .map((e) => LearnTopicsToId[e] ?? '')
        .where((e) => e != '')
        .toList();
    List<String> testPreparations = wantToLearn
        .where((e) => TestPreparationsToId.keys.contains(e))
        .map((e) => TestPreparationsToId[e] ?? '')
        .where((e) => e != '')
        .toList();

    var user = (await ApiService().updateUserInfo(name, country, phone,
        birthday, level, learnTopics, testPreparations, context));

    if (mounted) if (user != null)
      setState(() {
        this.user = user;
      });
  }
}
