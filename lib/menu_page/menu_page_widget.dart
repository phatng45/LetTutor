import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/index.dart';
import 'package:let_tutor/schedule_page/schedule_page_widget.dart';
import 'package:let_tutor/update_info_page/update_info_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../chat_gpt/message.dart';
import '../main.dart';
import '../models/user.dart';

class MenuPageWidget extends StatefulWidget {
  const MenuPageWidget({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<MenuPageWidget> createState() => _MenuPageWidgetState();
}

class _MenuPageWidgetState extends State<MenuPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TabHeader(
                title: '',
                start: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.indigo,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(900.0),
                        child: Image.network(
                          widget.user.avatar ??
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      (widget.user.name ?? 'Unnamed') +
                          (widget.user.roles?.contains('tutor') ?? false
                              ? " (Tutor)".tr
                              : " (Student)".tr),
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Text('Update Information'.tr,
                          style: FlutterFlowTheme.of(context).subtitle1),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        MyApp.To(context, UpdateInfoWidget(widget.user));
                      },
                    ),
                    ListTile(
                      title: Text('Become a Tutor'.tr,
                          style: FlutterFlowTheme.of(context).subtitle1),
                      leading: Icon(Icons.school),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    Divider(),
                    SwitchListTile(
                      title: Text('Dark mode'.tr,
                          style: FlutterFlowTheme.of(context).subtitle1),
                      value: true,
                      onChanged: (bool value) {},
                      secondary: Icon(Icons.dark_mode),
                    ),
                    ListTile(
                      title: Text('Language'.tr,
                          style: FlutterFlowTheme.of(context).subtitle1),
                      leading: Icon(Icons.language),
                      trailing: Icon(Icons.chevron_right),
                      subtitle: Text('English'.tr,
                          style: FlutterFlowTheme.of(context).subtitle2),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Change Password'.tr,
                          style: FlutterFlowTheme.of(context).subtitle1),
                      leading: Icon(Icons.lock),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Remove ChatGPT History'.tr,
                          style: FlutterFlowTheme.of(context).subtitle1),
                      leading: Icon(Icons.delete_rounded),
                      onTap: () => _buildConfirmRemoveHistoryDialog(context),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            textStyle: FlutterFlowTheme.of(context).subtitle1),
                        onPressed: () => _logout(),
                        child: SizedBox(
                            width: double.maxFinite,
                            height: 50,
                            child: Center(child: Text('Logout'.tr))))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logout() {
    MyApp.prefs.remove("ACCESS_TOKEN");
    MyApp.To(context, LoginPageWidget());
  }

  void _buildConfirmRemoveHistoryDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Remove history?'.tr,
                      style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: FlutterFlowTheme.of(context).title2Family,
                          fontSize: 22)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Are you sure you want to delete the conversation? You cannot undo this action.'
                          .tr),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 85,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            elevation: 0,
                          ),
                          child: Text("Cancel".tr),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 85,
                        child: OutlinedButton(
                          onPressed: () {
                            _removeAllMessages();
                            setState(() {});
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            side: const BorderSide(color: Colors.redAccent),
                            foregroundColor: Colors.redAccent,
                          ),
                          child: Text("Remove".tr),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }

  void _removeAllMessages() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('messages_key', Message.encode(<Message>[]));
  }
}
