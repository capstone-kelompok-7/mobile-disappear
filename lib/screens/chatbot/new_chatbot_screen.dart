import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
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
  final List<String> _messages = []; // List to store chat messages
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
            child: ListView.builder(
              itemCount: _messages.length,
              // reverse: true,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                final isQuestion = index.isEven;
                var alignment =
                    isQuestion ? Alignment.centerRight : Alignment.centerLeft;

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

                return Align(
                    alignment: alignment,
                    // isQuestion ? WrapAlignment.end : WrapAlignment.start,
                    child: BubbleNormal(
                      tail: true,
                      text: message,
                      isSender: isQuestion ? true : false,
                      color: isQuestion ? secondary00 : warning00,
                    )
                    // Container(
                    //   padding: EdgeInsets.all(12),
                    //   decoration: BoxDecoration(
                    //     color: isQuestion ? secondary00 : warning00,
                    //     borderRadius: BorderRadius.only(
                    //       bottomLeft: isQuestion
                    //           ? Radius.circular(20.0)
                    //           : Radius.circular(0.0),
                    //       bottomRight: isQuestion
                    //           ? Radius.circular(0.0)
                    //           : Radius.circular(20.0),
                    //       topLeft: Radius.circular(5.0),
                    //       topRight: Radius.circular(5.0),
                    //     ),
                    //   ),
                    //   child: Container(
                    //     child: Text(
                    //       message,
                    //       style:
                    //           TextStyle(color: Colors.black, fontSize: 12),
                    //       softWrap: true,
                    //     ),
                    //   ),
                    // ),

                    );
              },
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

                      // Posting question
                      // final responseQuestion =
                      state.postQuestion(question);
                      // setState(() {
                      //   _messages.insert(0, responseQuestion['data']);
                      // });

                      // Posting answer
                      final responseAnswer = await state.postAnswer(question);

                      setState(() {
                        _messages.add(question);
                        _messages.add(responseAnswer['data']);
                      });

                      _textController.clear();
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
