import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/schedule_page/schedule_page_widget.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(900.0),
                  child: Image.network(
                    widget.user.avatar ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Text(widget.user.name ?? 'Unnamed'),
                ListTile(
                  title: Text('Update Profile'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                SwitchListTile(
                  title: Text('Dark mode'),
                  value: true,
                  onChanged: (bool value) {},
                  secondary: Icon(Icons.dark_mode),
                ),
                ListTile(
                  title: Text('Language'),
                  leading: Icon(Icons.language),
                  trailing: Icon(Icons.chevron_right),
                  subtitle: Text('English'),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        textStyle: FlutterFlowTheme.of(context).subtitle1),
                    onPressed: () {},
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: Center(child: Text('Logout'))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
