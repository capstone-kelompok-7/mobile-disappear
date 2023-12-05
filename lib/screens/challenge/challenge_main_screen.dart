import 'package:disappear/screens/challenge/challenge_components.dart';
import 'package:disappear/screens/leaderboard/leaderboard_component_standing.dart';
import 'package:disappear/screens/leaderboard/leaderboard_screen.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeMainScreen extends StatefulWidget {
  static const String routePath = '/challenge-main-screen';
  const ChallengeMainScreen({super.key});

  @override
  State<ChallengeMainScreen> createState() => _ChallengeMainScreenState();
}

class _ChallengeMainScreenState extends State<ChallengeMainScreen> {
  @override
  Widget build(BuildContext context) {
    final challengeProvider =
        Provider.of<ChallengeMainViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          elevation: 2.5,
          leading: const Icon(Icons.arrow_back_ios),
          title: Consumer<ChallengeMainViewModel>(
            builder: (context, appBar, _) {
              return challengeProvider.selectedTabChallenge == 1
                  ? const Text('Tantangan', style: semiBoldBody1)
                  : appBar.selectedTabChallenge == 2
                      ? const Text('Leaderboard', style: semiBoldBody1)
                      : const Text('Kuponku', style: semiBoldBody1);
            },
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Consumer<ChallengeMainViewModel>(
              builder: (context, bodyConsumer, _) {
                return SizedBox(
                  child: bodyConsumer.topButton(),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Consumer<ChallengeMainViewModel>(
              builder: (context, bodyConsumer, _) {
                return bodyConsumer.selectedTabChallenge == 1
                    ? Expanded(
                        child: FutureBuilder(
                            future: bodyConsumer.fetchAllChallenge(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return Text('Tidak ada Tantangan Tersedia');
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return ChallengeComponents(
                                      challengesModel: snapshot.data![index],
                                    );
                                  },
                                );
                              }
                            }),
                      )
                    : Expanded(
                        child: FutureBuilder(
                            future: bodyConsumer.fetchLeaderboard(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return Text('Tidak ada Challenge Tersedia');
                              } else {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      LeaderboardScreen(
                                              leaderboardModel:
                                                  snapshot.data![0]),
                                        
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return LeaderboardComponentStanding(
                                              leaderboardModel:
                                                  snapshot.data![index]);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }),
                      );
              },
            ),
          ],
        )

        // Consumer<ChallengeMainViewModel>(
        //   builder: (context, bodyConsumer, _) {
        //     return FutureBuilder(
        //         future: bodyConsumer.fetchAllChallenge(),
        //         builder: (context, snapshot) {
        //           if (snapshot.hasError) {
        //             return const Text('Tidak ada challenge yang tersedia');
        //           }

        //           if (snapshot.hasData) {
        //             return ListView.builder(
        //               itemBuilder: (context, index) {
        //                 return Column(
        //                   children: [
        //                     bodyConsumer.topButton(),
        //                     bodyConsumer.selectedTabChallenge == 1
        //                         ? ChallengeComponents(
        //                             challengesModel: snapshot.data![index],
        //                           )
        //                         : bodyConsumer.selectedTabChallenge == 2
        //                             ? const LeaderboardScreen()
        //                             : const VoucherScreen(),
        //                   ],
        //                 );
        //               },
        //             );
        //           }
        //           return Column(
        //             children: [],
        //           );
        //         });
        //   },
        // ),
        );
  }
}
