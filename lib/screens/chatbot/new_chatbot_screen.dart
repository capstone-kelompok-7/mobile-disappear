// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:disappear/themes/color_scheme.dart';
// import 'package:disappear/themes/text_theme.dart';
// import 'package:disappear/view_models/chatbot/chatbot_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class NewChatbotScreen extends StatefulWidget {
//   static String routePath = '/newchatbot';
//   const NewChatbotScreen({super.key});

//   @override
//   State<NewChatbotScreen> createState() => _NewChatbotScreenState();
// }

// class _NewChatbotScreenState extends State<NewChatbotScreen> {
//   final ChatUser _currentUser = ChatUser(id: '1', firstName: 'User 1');
//   final ChatUser _chatbotUser = ChatUser(id: '2', firstName: 'Chatbot');

//   List<ChatMessage> _listmessages = <ChatMessage>[];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primary40,
//         title: Text(
//           'Chatbot',
//           style: semiBoldBody3.copyWith(fontSize: 24, color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<ChatbotViewModel>(builder: (context, state, _) {
//         return Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: DashChat(
//               messageOptions: MessageOptions(
//                   currentUserContainerColor: secondary00,
//                   containerColor: Color.fromRGBO(253, 238, 206, 1),
//                   textColor: Colors.black,
//                   currentUserTextColor: Colors.black),
//               currentUser: _currentUser,
//               onSend: (ChatMessage m) async {
//                 // dynamic questionResponse = await state.postQuestion(m);
//                 // if (questionResponse != null && questionResponse.isNotEmpty) {
//                 //   dynamic answerResponse =
//                 //       await state.postAnswer(questionResponse);
//                 // }

//                 // List<ChatMessage> _messagesHistory = _listmessages.map((e) {
//                 //   if (m.user == _currentUser) {
//                 //     return ChatMessage(user: user, createdAt: createdAt)
//                 //   }

//                 // },)
//                 final responsePostQuestion = await state.postQuestion(m);
//                 setState(() {
//                   _listmessages.insert(0, responsePostQuestion);
//                 });
//                 final responsePostAnswer = await state.postAnswer(m);
//                 for (var element in responsePostAnswer) {
//                   if (element != null) {
//                     setState(() {
//                       _listmessages.insert(
//                           0,
//                           ChatMessage(
//                               user: _chatbotUser,
//                               createdAt: DateTime.now(),
//                               text: element));
//                     });
//                   }
//                 }
//               },
//               messages: _listmessages),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = []; // List to store chat messages
  final TextEditingController _textController = TextEditingController(); // Controller for the text field

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.insert(0, text); // Add the new message to the list
      });
      _textController.clear(); // Clear the text field after sending message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: true, // Reverse the list to display messages from bottom to top
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]), // Display each message in a ListTile
                );
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _handleSubmitted(_textController.text);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }
}