import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';

class TutorGeneralInfoWidget extends StatefulWidget {
  TutorGeneralInfoWidget({
    Key? key,
    required this.hasRating,
  }) : super(key: key);

  final bool hasRating;

  bool favorited = false;

  static const Icon favoriteIcon = Icon(
    Icons.favorite_rounded,
    color: Color(0xFFFF5686),
    size: 25.0,
  );

  static const Icon unfavoriteIcon = Icon(
    Icons.favorite_border,
    color: Color(0xFF2767FF),
    size: 25.0,
  );

  @override
  State<TutorGeneralInfoWidget> createState() => _TutorGeneralInfoWidgetState();
}

class _TutorGeneralInfoWidgetState extends State<TutorGeneralInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(900.0),
          child: Image.network(
            'https://picsum.photos/seed/437/600',
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adelia Rice',
                style: FlutterFlowTheme.of(context).title3,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/4060/4060248.png',
                      width: 20.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'France',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
              widget.hasRating == false
                  ? SizedBox.shrink()
                  : RatingBarIndicator(
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFCA77),
                      ),
                      direction: Axis.horizontal,
                      rating: 3.0,
                      unratedColor: Color(0xFF9E9E9E),
                      itemCount: 5,
                      itemSize: 20.0,
                    ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: IconButton(
              onPressed: () => setState(() {
                widget.favorited = !widget.favorited;
              }),
              icon: widget.favorited
                  ? TutorGeneralInfoWidget.favoriteIcon
                  : TutorGeneralInfoWidget.unfavoriteIcon,
            ),
          ),
        ),
      ],
    );
  }
}
