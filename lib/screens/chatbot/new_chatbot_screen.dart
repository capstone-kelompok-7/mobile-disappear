import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:disappear/models/chatbot_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:disappear/view_models/chatbot/chatbot_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NewChatbotScreen extends StatefulWidget {
  static String routePath = '/newchatbot';
  const NewChatbotScreen({super.key});

  @override
  State<NewChatbotScreen> createState() => _NewChatbotScreenState();
}

class _NewChatbotScreenState extends State<NewChatbotScreen> {
  @override
  void initState() {
    // final chatbotProvider =
    //     Provider.of<ChatbotViewModel>(context, listen: false);
    // final chatHistory = chatbotProvider.getChatHistory();
    // _messages.addAll(chatHistory);
    getHistory();
    super.initState();
  }

  void getHistory() async {
    final chatbotProvider =
        Provider.of<ChatbotViewModel>(context, listen: false);
    final chatHistory = chatbotProvider.getChatHistory();
    // setState(() async {
    //   _messages.addAll(await chatHistory);
    // });

    chatHistory.then(
      (value) {
        for (var element in value) {
          setState(() {
            _messages.add(element);
          });
        }
      },
    );

    debugPrint(_messages.toString());
  }

  final List<ChatbotModel> _messages = []; // List to store chat messages
  final TextEditingController _textController =
      TextEditingController(); // Controller for the text field

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: primary40,
    //     title: Text(
    //       'Chatbot',
    //       style: semiBoldBody3.copyWith(fontSize: 24, color: Colors.white),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Consumer<ChatbotViewModel>(builder: (context, state, _) {
    //     return Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: DashChat(
    //           messageOptions: MessageOptions(
    //               currentUserContainerColor: secondary00,
    //               containerColor: Color.fromRGBO(253, 238, 206, 1),
    //               textColor: Colors.black,
    //               currentUserTextColor: Colors.black),
    //           currentUser: _currentUser,
    //           onSend: (ChatMessage m) async {
    //             dynamic questionResponse = await state.postQuestion(m);
    //             if (questionResponse != null && questionResponse.isNotEmpty) {
    //               dynamic answerResponse =
    //                   await state.postAnswer(questionResponse);
    //             }

    //             List<ChatMessage> _messagesHistory = _listmessages.map((e) {
    //               if (m.user == _currentUser) {
    //                 return ChatMessage(user: user, createdAt: createdAt)
    //               }

    //             },)
    //             final responsePostQuestion = await state.postQuestion(m);
    //             setState(() {
    //               _listmessages.insert(0, responsePostQuestion);
    //             });
    //             final responsePostAnswer = await state.postAnswer(m);
    //             for (var element in responsePostAnswer) {
    //               if (element != null) {
    //                 setState(() {
    //                   _listmessages.insert(
    //                       0,
    //                       ChatMessage(
    //                           user: _chatbotUser,
    //                           createdAt: DateTime.now(),
    //                           text: element));
    //                 });
    //               }
    //             }
    //           },
    //           messages: _listmessages),
    //     );
    //   }),
    // );
    // }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primary40,
        title:
            Text('Chatbot', style: semiBoldBody1.copyWith(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: _messages.isNotEmpty
                ? ListView.builder(
                    itemCount: _messages.length,
                    // reverse: true,
                    itemBuilder: (BuildContext context, int index) {
                      final message = _messages[index];
                      final isQuestion = message.role == "question";
                      // var alignment =
                      //     isQuestion ? Alignment.centerRight : Alignment.centerLeft;

                      // return Container(
                      //   alignment: alignment,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: Container(
                      //       padding: EdgeInsets.all(12),
                      //       decoration: BoxDecoration(
                      //         color: isQuestion ? Colors.blue : Colors.grey,
                      //         borderRadius: BorderRadius.only(
                      //           topLeft: isQuestion
                      //               ? Radius.circular(12.0)
                      //               : Radius.circular(0.0),
                      //           topRight: isQuestion
                      //               ? Radius.circular(0.0)
                      //               : Radius.circular(12.0),
                      //           bottomLeft: Radius.circular(12.0),
                      //           bottomRight: Radius.circular(12.0),
                      //         ),
                      //       ),
                      //       child: Text(message),
                      //     ),
                      //   ),
                      // );

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: BubbleNormal(
                          tail: true,
                          text: message.text,
                          isSender: isQuestion ? true : false,
                          color: isQuestion ? secondary00 : warning00,
                        ),
                      );
                    },
                  )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/Secretary.png",
                        width: 70,
                        height: 70,
                      ),
                      Text(
                        "jilaru",
                        style: boldBody1.copyWith(
                          color: blackColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40 , left: 10, right: 10),
                        child: Text(
                          "Aku merupakan AI chatbot yang dapat membantu kamu dalam mengatasi permasalahan lingkungan hijau yang ada. Mari mengobrol!",
                          style: regularBody5.copyWith(
                            color: blackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
          ),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    // return Container(
    //   margin: EdgeInsets.symmetric(horizontal: 8.0),
    //   child: Row(
    //     children: <Widget>[
    //       Flexible(
    //         child: TextField(
    //           controller: _textController,
    //           onSubmitted: _handleSubmitted,
    //           decoration: InputDecoration.collapsed(hintText: 'Send a message'),
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.symmetric(horizontal: 4.0),
    //         child: IconButton(
    //           icon: Icon(Icons.send),
    //           onPressed: () {
    //             _handleSubmitted(_textController.text);
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Consumer<ChatbotViewModel>(builder: (context, state, _) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 5, right: 5),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              fillColor: Colors.white,
              hintText: 'Tanyakan apapun padaku',
              suffixIcon: GestureDetector(
                  onTap: () async {
                    if (_textController.text.isNotEmpty) {
                      final question = _textController.text;
                      _textController.clear();

                      // Posting question
                      // final responseQuestion =
                      state.postQuestion(question);
                      setState(() {
                        _messages.add(
                            ChatbotModel(role: 'question', text: question));
                      });
                      // setState(() {
                      //   _messages.insert(0, responseQuestion['data']);
                      // });

                      // Posting answer
                      final responseAnswer = await state.postAnswer(question);

                      setState(() {
                        _messages.add(ChatbotModel(
                            role: 'answer', text: responseAnswer['data']));
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset('assets/img/send_fast.svg'),
                  ))

              // IconButton(
              //   onPressed: () async {
              //     if (_textController.text.isNotEmpty) {
              //       final question = _textController.text;
              //       // Posting question
              //       // final responseQuestion =
              //       state.postQuestion(question);
              //       // setState(() {
              //       //   _messages.insert(0, responseQuestion['data']);
              //       // });
              //       // Posting answer
              //       final responseAnswer = await state.postAnswer(question);
              //       setState(() {
              //         _messages.add(question);
              //         _messages.add(responseAnswer['data']);
              //       });
              //       _textController.clear();
              //     }
              //   },
              //   icon: Icon(Icons.send),
              // ),
              ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _textController
        .dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }
}
