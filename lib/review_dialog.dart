import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'api/api_service.dart';
import 'models/tutor.dart';

class ReviewDialog extends StatefulWidget {
  ReviewDialog({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  final ScrollController _feedbacksScrollController = new ScrollController();
  List<Feedbacks> _feedbacks = [];

  bool _isFeedbackLoading = false;
  int _feedbackPage = 1;
  static const int _feedbackPerPage = 10;

  @override
  void initState() {
    super.initState();
    _getFeedbacks(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          width: double.maxFinite,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollEndNotification &&
                  _feedbacksScrollController.position.extentAfter == 0) {
                _getFeedbacks(widget.userId);
              }
              return true;
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Others review',
                        style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).title2Family,
                            fontSize: 22),
                      ),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Close',
                            style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).title3Family,
                                color: Colors.grey),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _feedbacks.length == 0
                      ? new Center(
                          child: Text('This tutor has no review.',
                              style: FlutterFlowTheme.of(context).subtitle2))
                      : Expanded(
                          child: ListView.separated(
                            physics: AlwaysScrollableScrollPhysics(),
                            controller: _feedbacksScrollController,
                            shrinkWrap: true,
                            itemCount: _feedbacks.length + 1,
                            itemBuilder: (context, index) {
                              if (index == _feedbacks.length) {
                                return _buildProgressIndicator();
                              } else {
                                final feedback = _feedbacks[index];
                                return _buildFeedback(feedback);
                              }
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                color: Colors.black12,
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }

  Container _buildFeedback(Feedbacks feedback) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.network(
                feedback.firstInfo?.avatar ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                width: 30.0,
                height: 30.0,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU',
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  );
                },
              )),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(feedback.firstInfo?.name ?? 'N/A',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle2Family,
                              fontSize: 13,
                            )),
                    Text(timeago.format(DateTime.parse(feedback.createdAt!)),
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            fontSize: 12,
                            fontStyle: FontStyle.italic))
                  ],
                ),
                RatingBarIndicator(
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFFCA77),
                  ),
                  rating: (feedback.rating ?? 0) * 1.0,
                  unratedColor: Color(0xFF9E9E9E),
                  itemCount: 5,
                  itemSize: 18,
                ),
                Text(
                  feedback.content ?? '',
                  style: FlutterFlowTheme.of(context).subtitle1.override(
                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: _isFeedbackLoading ? 1 : 0,
          child: CircularProgressIndicator(
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }

  void _getFeedbacks(String userId) async {
    setState(() {
      _isFeedbackLoading = true;
    });

    var newFeedbacks = (await ApiService()
        .feedbackPagination(userId, _feedbackPerPage, _feedbackPage))!;

    if (mounted)
      setState(() {
        _isFeedbackLoading = false;
        _feedbacks.addAll(newFeedbacks);
        _feedbackPage += 1;
        print("_feedbackPage: " + _feedbackPage.toString());
      });
  }
}
