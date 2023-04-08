import 'package:flutter/material.dart';
import 'package:let_tutor/schedule_page/schedule_page_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, this.onBackPressed}) : super(key: key);

  VoidCallback? onBackPressed;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  final List<String> _nationalitiesFilters = <String>[];
  late String _specialty = 'All';

  final List<String> _nationalities = <String>[
    'Foreign',
    'Vietnamese',
    'Native English'
  ];

  final List<String> _specialties = <String>[
    'All',
    'English for kids',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS',
    'KET',
    'PET',
    'IELTS',
    'TOEFL',
    'TOEIC',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                TabHeader(
                  title: 'Find a Tutor',
                  start: IconButton(
                      onPressed: widget.onBackPressed,
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.indigo,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          // isDense: true,
                          hintText: 'Tutor name',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText2Family,
                                  fontSize: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFdddddd),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFdddddd),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: false,
                          fillColor: Color(0xFFE4E4E4),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text('Nationality',
                            textAlign: TextAlign.left,
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title1Family,
                                  color: Colors.indigo,
                                  fontSize: 25,
                                )),
                      ),
                      Wrap(
                        children: _nationalities.map((String nationality) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                            child: FilterChip(
                              showCheckmark: false,
                              selectedColor: Color(0xFFBCE8FF),
                              visualDensity:
                                  VisualDensity(horizontal: 0.0, vertical: -4),
                              backgroundColor: Color(0xFFdddddd),
                              side: BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                              // disabledColor: Colors.black12,
                              label: Text(nationality),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontSize: 15,
                                    color: _nationalitiesFilters
                                            .contains(nationality)
                                        ? Color(0xFF2767FF)
                                        : Colors.black45,
                                  ),
                              selected:
                                  _nationalitiesFilters.contains(nationality),
                              onSelected: (bool value) {
                                setState(() {
                                  if (value) {
                                    if (!_nationalitiesFilters
                                        .contains(nationality)) {
                                      _nationalitiesFilters.add(nationality);
                                    }
                                  } else {
                                    _nationalitiesFilters
                                        .removeWhere((String name) {
                                      return name == nationality;
                                    });
                                  }
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                        child: Text('Specialties',
                            textAlign: TextAlign.left,
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title1Family,
                                  color: Colors.indigo,
                                  fontSize: 25,
                                )),
                      ),
                      Wrap(
                        children: _specialties.map((String specialty) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                            child: FilterChip(
                              showCheckmark: false,
                              selectedColor: Color(0xFFBCE8FF),
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              backgroundColor: Color(0xFFdddddd),
                              side: BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                              // disabledColor: Colors.black12,
                              label: Text(specialty),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontSize: 15,
                                    color: _specialty == specialty
                                        ? Color(0xFF2767FF)
                                        : Colors.black45,
                                  ),
                              selected: _specialty == specialty,
                              onSelected: (bool value) {
                                setState(() {
                                  if (value) {
                                    _specialty = specialty;
                                  }
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
