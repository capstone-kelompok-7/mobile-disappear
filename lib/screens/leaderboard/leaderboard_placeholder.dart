import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LeaderboardPlaceholder extends StatelessWidget {
  const LeaderboardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: neutral00,
      highlightColor: neutral20,
      child: Column(
        children: [
          //PODIUM PLACEHOLDER
          Padding(
            padding: const EdgeInsets.only(
              left: 72,
              right: 72,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //JUARA 2
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          0xffd9d9d9,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 120,
                      width: 70,
                      decoration: const BoxDecoration(color: Color.fromRGBO(250, 213, 133, 1)),
                    ),
                  ],
                ),

                //JUARA 1//
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          0xffd9d9d9,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 150,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Color(
                          0xffd9d9d9,
                        ),
                      ),
                    ),
                  ],
                ),

                //JUARA 3//
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          0xffd9d9d9,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 90,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Color(
                          0xffd9d9d9,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //GAP 
          const SizedBox(
            height: 30,
          ),

          //STANDING KLASMEN PLACEHOLDER
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              int displayIndex = index + 1;
              return Shimmer.fromColors(
                  baseColor: neutral00,
                  highlightColor: neutral20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 10,
                          child: Text('$displayIndex'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(
                              0xffd9d9d9,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('', style: semiBoldBody5),
                        Expanded(
                            child: Text('',
                                style: mediumBody8.copyWith(color: neutral20))),
                        const Text(' EXP', style: semiBoldBody8),
                      ],
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}
