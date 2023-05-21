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

  bool _isTextFieldNotEmpty = false;
  bool _darkMode = false;

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
            color: FlutterFlowTheme.of(context).secondaryBackground),
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
                        color: FlutterFlowTheme.of(context).primaryColor,
                      )),
                  Text('ChatGPT', style: FlutterFlowTheme.of(context).title1),
                ],
              ),
              // _buildChatGPTIntroduction(context),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: _messages.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0)
                          return _buildChatGPTIntroduction(context);
                        else {
                          final Message message = _messages[index - 1];
                          return message.isUser()
                              ? _buildUserMessage(message)
                              : _buildSystemMessage(message);
                        }
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

  Padding _buildChatGPTIntroduction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Text(
            'ChatGPT may produce inaccurate information about people, places, or facts.'.tr,
            style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                color: Colors.grey.shade500,
                fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Divider(indent: 20, endIndent: 20, color: Colors.black12)
        ],
      ),
    );
  }

  _buildMessageComposer() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 17, 15, 17),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    hintStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
                        color: Colors.grey.shade500,
                        fontSize: 16),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: 'Send a message'.tr,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    filled: true,
                    suffixIcon: _isTextFieldNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _send(_textEditingController.text);
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: Colors.indigo,
                              size: 25,
                            ))
                        : const SizedBox.shrink()),
              ),
            ),
          ],
        ),
      ),
    );
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
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.indigo,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          "https://assets.stickpng.com/images/63c52af590250dd34bd6a9ab.png",
          color: Colors.white,
          colorBlendMode: BlendMode.srcIn,
        ),
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
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  m.text,
                  style: const TextStyle(
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
        state: BotMessageState.CanPlay);

    _saveMessages();

    setState(() {
      _messages.add(newMessage);

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
    await prefs.setBool(LANGUAGE_PREF_KEY, Get.locale?.countryCode == 'US');
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

      if (isEnLanguage) {
        Get.updateLocale(const Locale('en', 'US'));
      } else {
        Get.updateLocale(const Locale('vn', 'VN'));
      }
    });
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
