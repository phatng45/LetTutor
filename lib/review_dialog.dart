import 'package:flutter/material.dart';

import 'api/api_service.dart';
import 'models/tutor.dart';

class ReviewDialog extends StatefulWidget {
  ReviewDialog({Key? key, required this.userId}) : super(key: key);
  String userId;

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
          height: MediaQuery.of(context).size.height * .8,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollEndNotification &&
                  _feedbacksScrollController.position.extentAfter == 0) {
                _getFeedbacks(widget.userId);
              }
              return true;
            },
            child: SingleChildScrollView(
              controller: _feedbacksScrollController,
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Remove history?',
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
                    ),
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
                            child: const Text("Cancel"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 85,
                          child: OutlinedButton(
                            onPressed: () {
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
                            child: const Text("Remove"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Container _buildFeedback(Feedbacks feedback) {
    return Container(
        color: Colors.grey.shade100,
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Text(feedback.content ?? ''));
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1,
          child: new CircularProgressIndicator(
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
