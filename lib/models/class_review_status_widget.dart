import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/components/best_divider_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/models/class_schedule_status_widget.dart';

class ClassReviewStatus extends StatelessWidget {
  const ClassReviewStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClassTime(),
              Text(
                "Joined",
                style: FlutterFlowTheme.of(context).title2,
              )
            ],
          ),
          BestDividerWidget(title: ''),
          TutorReview(context),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NegativeButton(title: 'Report'),
                PositiveButton(title: 'Add a rating',icon: Icon(Icons.star_rounded, size: 22),)
                 ],
            ),
          ),
        ],
      ),
    );
  }

  ExpandablePanel TutorReview(BuildContext context) {
    return ExpandablePanel(
          collapsed: Text(
            "Good student \nWe finished this lesson",
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          expanded: Text(
            "Good student \nWe finished this lesson",
            softWrap: true,
          ),
          header: Text(
            "Tutor reviews",
            style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: FlutterFlowTheme.of(context).title1Family,
                color: Colors.indigo),
          ),
          theme: ExpandableThemeData(
            tapHeaderToExpand: true,
            hasIcon: true,
            iconColor: Colors.indigo,
            useInkWell: true,
            inkWellBorderRadius: BorderRadius.circular(20),
            collapseIcon: Icons.chevron_right,
            expandIcon: Icons.chevron_right,
            iconRotationAngle: 3.14 / 2,
          ),
        );
  }
}

class ClassTime extends StatelessWidget {
  const ClassTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fri, 30 Sep 2023',
          style: FlutterFlowTheme.of(context).title1,
        ),
        Text('18:30 - 18:55'),
      ],
    );
  }
}
