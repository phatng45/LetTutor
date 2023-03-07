import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    this.shape = const CircularNotchedRectangle(),
  });

  final NotchedShape? shape;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      surfaceTintColor: FlutterFlowTheme.of(context).primaryColor,
      color: FlutterFlowTheme.of(context).primaryColor,
      child: IconTheme(
        data: IconThemeData(color: Colors.indigo),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.schedule),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.sticky_note_2_outlined),
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
