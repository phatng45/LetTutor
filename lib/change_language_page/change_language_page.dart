import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../history_page/history_page_widget.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabHeader(
                title: '',
                start: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: FlutterFlowTheme.of(context).primaryColor,
                    )),
              ),
              ListTile(
                title: Text('English (US)',
                    style: FlutterFlowTheme.of(context).subtitle1),
                leading: CountryFlags.flag(
                  'us',
                  height: 35,
                  width: 35,
                ),
                onTap: () {
                  Get.updateLocale(const Locale('en', 'US'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Tiếng Việt',
                    style: FlutterFlowTheme.of(context).subtitle1),
                leading: CountryFlags.flag(
                  'vn',
                  height: 35,
                  width: 35,
                ),
                onTap: () {
                  Get.updateLocale(const Locale('vi', 'VN'));
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
