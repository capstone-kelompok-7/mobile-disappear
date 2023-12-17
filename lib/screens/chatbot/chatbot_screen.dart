import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/chatbot/chatbot_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ChatbotScreen extends StatefulWidget {
  static String routePath = '/newchatbot';
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  void initState() {
    final chatbotProvider =
        Provider.of<ChatbotViewModel>(context, listen: false);

    chatbotProvider.getChatHistoryInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatbotProvider =
        Provider.of<ChatbotViewModel>(context, listen: false);

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
      body: Consumer<ChatbotViewModel>(builder: (context, state, _) {
        return Column(
          children: [
            Flexible(
              child: state.listMessages.isNotEmpty
                  ? ListView.builder(
                      controller: state.scrollController,
                      itemCount: chatbotProvider.listMessages.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final message = state.listMessages[index];
                        final isQuestion = message.role == "question";

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
                          padding: const EdgeInsets.only(
                              top: 40, left: 10, right: 10),
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
            Consumer<ChatbotViewModel>(
              builder: (context, state, _) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, left: 5, right: 5),
                  child: TextField(
                    controller: state.textController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        fillColor: Colors.white,
                        hintText: 'Tanyakan apapun padaku',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              state.sendMessage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child:
                                  SvgPicture.asset('assets/img/send_fast.svg'),
                            ))),
                  ),
                );
              },
            )
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    // final chatbotProvider =
    //     Provider.of<ChatbotViewModel>(context, listen: false);
    // chatbotProvider.textController.dispose();
    super.dispose();
  }
}
