// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ChatBotEmptyScreen extends StatefulWidget {
  static const String routePath = '/chatbotempty';
  const ChatBotEmptyScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotEmptyScreen> createState() => _ChatBotEmptyScreenState();
}

class _ChatBotEmptyScreenState extends State<ChatBotEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Chatbot',
          style: semiBoldBody1,
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                    )
                  ],
                ),
                Text(
                  "Aku merupakan AI chatbot yang dapat membantu kamu dalam mengatasi permasalahan lingkungan hijau yang ada. Mari mengobrol!",
                  style: regularBody5.copyWith(
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: SizedBox(
                width: 385,
                height: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFEFE5DC)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.transparent,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'Tanyakan apapun padaku',
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.send,
                                    size: 24.0,
                                  ),
                                  padding: const EdgeInsets.all(1),
                                ),
                                hintStyle: const TextStyle(
                                  color: Color(0xFFBFBFBF),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0.11,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
