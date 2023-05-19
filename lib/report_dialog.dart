import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor/components/class_schedule_status_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';

class ReportDialog extends StatefulWidget {
  ReportDialog({Key? key, required this.userId, required this.username})
      : super(key: key);
  final String username;
  final String userId;

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  bool isAnnoying = false;
  bool isPretending = false;
  bool inappropriateContent = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .7,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Report ' + widget.username,
                  style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      fontSize: 22),
                ),
                Text("Help us understand what's happening".tr,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
                        fontStyle: FontStyle.italic)),
                CheckboxListTile(
                  value: isAnnoying,
                  title: Text(
                    "This tutor is annoying me".tr,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      isAnnoying = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  value: isPretending,
                  title: Text(
                    "This profile is pretending be someone or is fake".tr,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      isPretending = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  value: inappropriateContent,
                  title: Text(
                    "Inappropriate profile photo".tr,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      inappropriateContent = value!;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    NegativeButton(
                      title: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    PositiveButton(
                      title: 'Report',
                      onPressed: () {},
                      color: Colors.red,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
