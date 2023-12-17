import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LeaderboardComponentPodium extends StatefulWidget {
  final LeaderboardModel leaderboardModel;
  const LeaderboardComponentPodium({super.key, required this.leaderboardModel});

  @override
  State<LeaderboardComponentPodium> createState() => _LeaderboardComponentPodiumState();
}

class _LeaderboardComponentPodiumState extends State<LeaderboardComponentPodium> {
  @override
  Widget build(BuildContext context) {
    Widget leaderboard() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 2ND JUARA 2///
          Consumer<ChallengeMainViewModel>(
              builder: (context, leaderboardview, _) {
            return FutureBuilder<LeaderboardModel?>(
              future: leaderboardview.fetchSecondPosition(),
              builder: (context, secondPositionSnapshot) {
                LeaderboardModel? secondPosition =
                    secondPositionSnapshot.data;

                // If data is loading//
                if (secondPositionSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Shimmer.fromColors(
                      baseColor: neutral00,
                      highlightColor: neutral20,
                      child: Column(
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
                            height: 120,
                            width: 70,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(250, 213, 133, 1),
                            ),
                          ),
                        ],
                      ));
                }

                // If Server is error//
                else if (secondPositionSnapshot.hasError) {
                  return Text(
                      'Error: ${secondPositionSnapshot.error}'); // On error
                }

                // If success connect server , tapi gaada data di servor//
                else if (!secondPositionSnapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(
                            0xffd9d9d9,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '-',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '-',
                        style: regularBody7,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(250, 213, 133, 1),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2 nd',
                              style: semiBoldBody3,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '-',
                              style: regularBody8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                //SUCCESS GET DATA
                else {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(
                            0xffd9d9d9,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              secondPosition!.photoProfile.toString(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        secondPosition.name.toString(),
                        style: regularBody7,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: 70,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(250, 213, 133, 1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '2 nd',
                              style: semiBoldBody3,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${secondPosition.exp.toString()} EXP',
                              style: regularBody8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }),

          /// 1st JUARA 1///
          Consumer<ChallengeMainViewModel>(
              builder: (context, leaderboardview, _) {
            return FutureBuilder<LeaderboardModel?>(
              future: leaderboardview.fetchFirstPosition(),
              builder: (context, firstPositionSnapshot) {
                LeaderboardModel? firstPosition = firstPositionSnapshot.data;

                // While data is loading
                if (firstPositionSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Shimmer.fromColors(
                      baseColor: neutral00,
                      highlightColor: neutral20,
                      child: Column(
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
                              color: Color.fromRGBO(250, 213, 133, 1),
                            ),
                          ),
                        ],
                      ));
                }

                // On error
                else if (firstPositionSnapshot.hasError) {
                  return Text('Error: ${firstPositionSnapshot.error}');
                }

                // If no data is fetched
                else if (!firstPositionSnapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color:  Color(
                            0xffd9d9d9,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '-',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '-',
                        style: regularBody7,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Color(
                            0xffd9d9d9,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '1 st',
                              style: semiBoldBody3,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '-',
                              style: regularBody8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                //SUCCESS GET DATA
                else {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(
                            0xffd9d9d9,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              firstPosition!.photoProfile.toString(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        firstPosition.name.toString(),
                        style: regularBody7,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(205, 255, 204, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '1 st',
                              style: semiBoldBody3,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${firstPosition.exp.toString()} EXP',
                              style: regularBody8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }),

          /// 3rd JUARA 3///
          Consumer<ChallengeMainViewModel>(
              builder: (context, leaderboardview, _) {
            return FutureBuilder(
              future: leaderboardview.fetchThirdPosition(),
              builder: (context, thirdPositionSnapshot) {
                LeaderboardModel? thirdPosition = thirdPositionSnapshot.data;

                // While data is loading
                if (thirdPositionSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Shimmer.fromColors(
                      baseColor: neutral00,
                      highlightColor: neutral20,
                      child: Column(
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
                              color: Color.fromRGBO(250, 213, 133, 1),
                            ),
                          ),
                        ],
                      ));
                }

                // On error
                else if (thirdPositionSnapshot.hasError) {
                  return Text('Error: ${thirdPositionSnapshot.error}');
                }

                //If no data fetched from the server
                else if (!thirdPositionSnapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          color:  Color(
                            0xffd9d9d9,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '-',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '-',
                        style: regularBody7,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 90,
                        width: 70,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 204, 204, 1)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '3 rd',
                              style: semiBoldBody3,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '-',
                              style: regularBody8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                // SUCCESS fetch data
                else {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(
                            0xffd9d9d9,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              thirdPosition!.photoProfile.toString(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        thirdPosition.name.toString(),
                        style: regularBody7,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 90,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 204, 204, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '3 rd',
                              style: semiBoldBody3,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${thirdPosition.exp} EXP',
                              style: regularBody8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }),
        ],
      );
    }

    return leaderboard();
  }
}
