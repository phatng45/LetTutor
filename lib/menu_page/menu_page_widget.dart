import 'package:flutter/material.dart';
import 'package:let_tutor/schedule_page/schedule_page_widget.dart';

class MenuPageWidget extends StatefulWidget {
  const MenuPageWidget({Key? key}) : super(key: key);

  @override
  State<MenuPageWidget> createState() => _MenuPageWidgetState();
}

class _MenuPageWidgetState extends State<MenuPageWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>
          [
            TabHeader(title: '',
              start: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: Colors.indigo,
                  )),
            ),
          ],
        ),
      ),


    );
  }
}
