import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    // this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  // final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  // static final List<FloatingActionButtonLocation> centerLocations =
  //     <FloatingActionButtonLocation>[
  //   FloatingActionButtonLocation.centerDocked,
  //   FloatingActionButtonLocation.centerFloat,
  // ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      surfaceTintColor: FlutterFlowTheme.of(context).primaryColor,
      color: FlutterFlowTheme.of(context).primaryColor,
      child: IconTheme(
        data: IconThemeData(
            color: FlutterFlowTheme.of(context).primaryColor, size: 25),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            // if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.schedule),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.person_outline_rounded),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
      ),
    );
  }
}
