import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/chat_gpt/api_key.dart';
import '/chat_gpt/message.dart';

class ChatGPTPage extends StatefulWidget {
  const ChatGPTPage({Key? key}) : super(key: key);

  @override
  State<ChatGPTPage> createState() => _ChatGPTPageState();
}

class _ChatGPTPageState extends State<ChatGPTPage> {
  final ScrollController _scrollController = ScrollController();
  final DateFormat timeFormat = DateFormat("HH:mm");
  late TextEditingController _textEditingController;

  final List<bool> _speechOptions = <bool>[false, true];
  late List<Message> _messages = <Message>[];

  static const String MESSAGES_PREF_KEY = 'messages_key';
  static const String DARK_MODE_PREF_KEY = 'dark_mode_key';
  static const String AUTO_TTS_PREF_KEY = 'auto_tts_key';
  static const String LANGUAGE_PREF_KEY = 'language_key';
  static const String TOUCH_TO_SPEAK_PREF_KEY = 'touch_key';

  final openAI = OpenAI.instance.build(
      token: OPEN_AI_API_KEY,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 100)),
      isLog: false);

  bool _isListening = false;
  bool _isTextFieldNotEmpty = false;
  bool _darkMode = false;
  bool _autoTTS = true;

  late String _hintText = 'holdToTalk'.tr;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      final isTextFieldNotEmpty = _textEditingController.text.isNotEmpty;
      setState(() {
        _isTextFieldNotEmpty = isTextFieldNotEmpty;
      });
    });

    _loadSettings();
    _loadMessages().then((value) => {
          setState(() {
            _messages = value;
          })
        });
    _updateHintText();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        height: MediaQuery.of(context).size.height * .97,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: _darkMode ? Colors.grey[900] : Colors.white),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.indigo,
                      )),
                  Text('ChatGPT', style: FlutterFlowTheme.of(context).title1),
                ],
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: _messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = _messages[index];
                        return message.isUser()
                            ? _buildUserMessage(_messages[index])
                            : _buildSystemMessage(_messages[index]);
                      }),
                ),
              ),
              _buildMessageComposer(),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _buildLanguageBottomSheet(BuildContext context) {
  //   return showModalBottomSheet<void>(
  //     context: context,
  //     backgroundColor: _darkMode ? Colors.grey[900] : Colors.white,
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  //     builder: (BuildContext context) {
  //       return Container(
  //         height: 200,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 20.0),
  //               child: Text(
  //                 'Select Language'.tr,
  //                 style: const TextStyle(fontSize: 25),
  //               ),
  //             ),
  //             Row(
  //               // crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 Column(
  //                   children: <Widget>[
  //                     IconButton(
  //                       onPressed: () {
  //                         Get.updateLocale(const Locale('en', 'US'));
  //                         Navigator.pop(context);
  //                         _updateHintText();
  //                         _saveSettings();
  //                       },
  //                       iconSize: 50,
  //                       icon: Container(
  //                         decoration: const BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: Colors.black38,
  //                                 offset: Offset(0, 1),
  //                                 blurRadius: 2.0,
  //                               ),
  //                             ]),
  //                         child: Flag.fromCode(
  //                           FlagsCode.US,
  //                           borderRadius: 60,
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                     ),
  //                     const Text('English (US)')
  //                   ],
  //                 ),
  //                 Column(
  //                   children: <Widget>[
  //                     IconButton(
  //                       onPressed: () {
  //                         Get.updateLocale(const Locale('vi', 'VN'));
  //                         Navigator.pop(context);
  //                         _updateHintText();
  //                         _saveSettings();
  //                       },
  //                       iconSize: 50,
  //                       icon: Container(
  //                         decoration: const BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: Colors.black38,
  //                                 offset: Offset(0, 1),
  //                                 blurRadius: 2.0,
  //                               ),
  //                             ]),
  //                         child: Flag.fromCode(
  //                           FlagsCode.VN,
  //                           borderRadius: 60,
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                     ),
  //                     const Text('Tiếng Việt (VN)')
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  _buildMessageComposer() {
    return Container(
      color: _darkMode ? Colors.grey[900] : Colors.white,
      child: Column(
        children: [
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintStyle: FlutterFlowTheme.of(context).subtitle2,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            hintText: 'Start typing...'.tr,
                            fillColor: Colors.grey.withAlpha(50),
                            filled: true,
                          ),
                        ),
                      ),
                      _isTextFieldNotEmpty
                          ? IconButton(
                              onPressed: () {
                                _send(_textEditingController.text);
                              },
                              icon: const Icon(
                                Icons.send_rounded,
                                color: Colors.indigo,
                                size: 25,
                              ))
                          : const SizedBox.shrink()
                    ],
                  ),
                ), // SizedBox(height: 50,),
                SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isInHoldMode() => _speechOptions[1] == true;

  void _updateHintText() {
    setState(() {
      if (_isListening) {
        if (_speechOptions[0] == true) {
          _hintText = "Touch to Stop".tr;
        } else {
          _hintText = "Release to Stop".tr;
        }
      } else {
        if (_speechOptions[0] == true) {
          _hintText = "Touch to Talk".tr;
        } else {
          _hintText = "Hold to Talk".tr;
        }
      }
    });
  }

  void _listen() async {
    // bool available = await _stt.initialize(onError: (val) {
    //   setState(() {
    //     _isListening = false;
    //     _updateHintText();
    //   });
    // });
    // if (available) {
    //   setState(() {
    //     _isListening = true;
    //     _updateHintText();
    //   });
    //   _stt.listen(
    //       listenMode: ListenMode.search,
    //       onResult: (val) => setState(() {
    //         _textEditingController.text = val.recognizedWords;
    //         _updateHintText();
    //       }));
    // } else {
    //   setState(() => _isListening = false);
    //   _stt.stop();
    //   _updateHintText();
    // }
  }

  Widget _buildSystemMessage(Message m) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildSystemChatIcon(),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 275),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(8, 11, 8, 0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                        color: _darkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m.text,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color:
                                    _darkMode ? Colors.white : Colors.black54,
                                fontSize: 16),
                          ),
                          Text(
                            m.time,
                            style: TextStyle(
                                color:
                                    _darkMode ? Colors.white : Colors.black54,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // _buildCurrentVoiceGPTState(m),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildSystemChatIcon() {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _darkMode ? Colors.grey[800] : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ]),
      child: const Icon(
        Icons.sentiment_satisfied,
        color: Colors.orange,
      ),
    );
  }

  Widget _buildUserMessage(Message m) {
    return Align(
      alignment: Alignment.centerRight,
      child: Flexible(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Container(
            margin: const EdgeInsets.fromLTRB(8, 11, 8, 0),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  m.text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16),
                ),
                Text(
                  m.time,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _buildCurrentVoiceGPTState(Message m) {
  //   return Container(
  //       child: m.state == BotMessageState.Null
  //           ? null
  //           : m.state == BotMessageState.Loading
  //           ? Padding(
  //         padding: const EdgeInsets.only(top: 10.0),
  //         child: LoadingAnimationWidget.twoRotatingArc(
  //             size: 20, color: Colors.green),
  //       )
  //           : m.state == BotMessageState.Speaking
  //           ? Padding(
  //         padding: const EdgeInsets.only(top: 10.0),
  //         child: IconButton(
  //           onPressed: () {
  //             setState(() {
  //               _tts.stop();
  //               m.state = BotMessageState.CanPlay;
  //             });
  //           },
  //           icon: LoadingAnimationWidget.beat(
  //               size: 20, color: Colors.red),
  //         ),
  //       )
  //           : m.state == BotMessageState.CanPlay
  //           ? IconButton(
  //         onPressed: () {
  //           setState(() {
  //             for (Message message in _messages) {
  //               message.state = BotMessageState.CanPlay;
  //             }
  //
  //             m.state = BotMessageState.Speaking;
  //             _tts.speak(m.text);
  //             _tts.setCompletionHandler(() {
  //               setState(() {
  //                 m.state = BotMessageState.CanPlay;
  //               });
  //             });
  //           });
  //         },
  //         icon: const Padding(
  //           padding: EdgeInsets.only(top: 8.0),
  //           child: Icon(
  //             Icons.play_circle_outline_rounded,
  //             color: Colors.orange,
  //             size: 28,
  //           ),
  //         ),
  //       )
  //           : null);
  // }

  void _send(String prompt) async {
    setState(
      () {
        _messages.add(
          Message(
              sender: MessageSender.User,
              text: prompt,
              time: timeFormat.format(DateTime.now())),
        );
        _textEditingController.clear();
      },
    );
    Future.delayed(const Duration(milliseconds: 50)).then((_) => _scrollDown());
    final request =
        CompleteText(prompt: prompt, maxTokens: 100, model: Model.textDavinci3);
    CTResponse? response = await openAI.onCompletion(request: request);
    String result =
        response?.choices.first.text.replaceAll('\n', '') ?? 'Error';

    Message newMessage = Message(
        sender: MessageSender.Bot,
        text: result,
        time: timeFormat.format(DateTime.now()),
        state: _autoTTS ? BotMessageState.Speaking : BotMessageState.CanPlay);

    _saveMessages();

    setState(() {
      _messages.add(newMessage);

      if (newMessage.state == BotMessageState.Speaking) {
        // _tts.speak(newMessage.text);
        // _tts.setCompletionHandler(() {
        //   setState(() {
        //     newMessage.state = BotMessageState.CanPlay;
        //   });
        // });
      }

      Future.delayed(const Duration(milliseconds: 50))
          .then((_) => _scrollDown());
    });
  }

  void _saveMessages() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(MESSAGES_PREF_KEY, Message.encode(_messages));
  }

  Future<List<Message>> _loadMessages() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? messagesString = prefs.getString(MESSAGES_PREF_KEY);
    List<Message> messages =
        messagesString != null ? Message.decode(messagesString) : <Message>[];

    return messages;
  }

  void _saveSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(DARK_MODE_PREF_KEY, _darkMode);
    await prefs.setBool(AUTO_TTS_PREF_KEY, _autoTTS);
    await prefs.setBool(LANGUAGE_PREF_KEY, Get.locale?.countryCode == 'US');
    await prefs.setBool(TOUCH_TO_SPEAK_PREF_KEY, _speechOptions[0]);
  }

  void _loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool darkMode = prefs.getBool(DARK_MODE_PREF_KEY) ?? false;
    final bool autoTTS = prefs.getBool(AUTO_TTS_PREF_KEY) ?? true;
    final bool isEnLanguage = prefs.getBool(LANGUAGE_PREF_KEY) ?? true;
    final bool isTouchMode = prefs.getBool(TOUCH_TO_SPEAK_PREF_KEY) ?? false;

    setState(() {
      _darkMode = darkMode;
      // Get.changeTheme(darkMode ? MyApp.darkTheme : MyApp.lightTheme);

      _autoTTS = autoTTS;

      if (isEnLanguage) {
        Get.updateLocale(const Locale('en', 'US'));
      } else {
        Get.updateLocale(const Locale('vn', 'VN'));
      }

      _speechOptions[0] = isTouchMode;
      _speechOptions[1] = !isTouchMode;
      _updateHintText();
    });
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _buildConfirmRemoveHistoryDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
            backgroundColor: _darkMode ? Colors.grey[900] : Colors.white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
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
                  const Text(
                      'Are you sure you want to delete the conversation? You cannot undo this action.'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 85,
                        child: OutlinedButton(
                          onPressed: () {
                            _messages = <Message>[];
                            _saveMessages();
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
                      const SizedBox(
                        width: 10,
                      ),
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
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
