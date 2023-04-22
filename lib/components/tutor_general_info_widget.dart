import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country/countries.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:let_tutor/components/tutor_specialties_widget.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';

import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../models/tutor.dart';
import '../tutor_details_page/tutor_details_widget.dart';

class TutorGeneralInfoWidget extends StatefulWidget {
  TutorGeneralInfoWidget({
    Key? key,
    required this.context,
    required this.hasRating,
    this.tutor,
  }) : super(key: key);

  final BuildContext context;
     final Tutor? tutor;
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

  late Tutor? tutor = widget.tutor;
  late var country = Countries.byCodeOrName(
      tutor?.country ?? 'VN', tutor?.country ?? 'Vietnam');



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(900.0),
                child: Image.network(
                  tutor?.avatar ?? tutor?.user?.avatar ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                  width: 70.0,
                  height: 70.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tutor?.name ?? tutor?.user?.name ??  'N/A',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: CountryFlags.flag(
                            (country.alpha2Code ?? 'vn').toLowerCase(),
                            height: 22,
                            width: 22,
                            // borderRadius: 8,
                          ),
                        ),
                        Text(
                          country.name ?? 'Vietnam',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                    RatingBarIndicator(
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFCA77),
                      ),
                      direction: Axis.horizontal,
                      rating: tutor?.rating ?? 0,
                      unratedColor: Color(0xFF9E9E9E),
                      itemCount: 5,
                      itemSize: 20.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: ToggleIcon(
                    onPressed: () {
                      setState(() {
                        if(tutor != null){
                          tutor!.isFavorited = !tutor!.isFavorited;
                        }

                      });
                    },
                    value: tutor?.isFavorited ?? false,
                    onIcon: Icon(
                      Icons.favorite_border,
                      color: Color(0xFFFF5686),
                      size: 25.0,
                    ),
                    offIcon: Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFFFF5686),
                      size: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
