import 'package:disappear/screens/challenge/challenge_components.dart';
import 'package:disappear/screens/challenge/challenge_placeholder.dart';
import 'package:disappear/screens/leaderboard/leaderboard_component_standing.dart';
import 'package:disappear/screens/leaderboard/leaderboard_placeholder.dart';
import 'package:disappear/screens/leaderboard/leaderboard_screen.dart';
import 'package:disappear/screens/voucher/user_voucher_components.dart';
import 'package:disappear/screens/voucher/voucher_placeholder.dart';
import 'package:disappear/screens/voucher/voucher_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
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
          backgroundColor: primary40,
          elevation: 2.5,
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
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return ChallengePlaceholder();
                                },
                              );
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

                  //LEADERBOARD
                  : bodyConsumer.selectedTabChallenge == 2
                      ? Expanded(
                          child: FutureBuilder(
                              future: bodyConsumer.fetchLeaderboard(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return LeaderboardPlaceholder();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return Text('Tidak ada Leaderboard Tersedia');
                                } else {
                                  return ListView(
                                    shrinkWrap: true,
                                    children: [
                                      LeaderboardComponentPodium(
                                          leaderboardModel: snapshot.data![0]),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      LeaderboardComponentStanding(
                                          leaderboardModel: snapshot.data![0])
                                    ],
                                  );
                                }
                              }),
                        )

                      //VOUCHER
                      : Expanded(
                          child: ListView(
                          children: [
                            //voucher SAYA (sudah klaim)
                            Consumer<ChallengeMainViewModel>(
                                builder: (context, state, _) {
                              return FutureBuilder(
                                  future: state.fetchUserVoucher(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Column(
                                        children: [VoucherPlaceholder()],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return Text('Tidak ada Kupon Tersedia');
                                    } else {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 170,
                                                left: 29,
                                                top: 25,
                                                bottom: 15),
                                            child: Text('Kupon Saya',
                                                style: mediumBody5.copyWith()),
                                          ),
                                          ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: snapshot.data!.length,
                                              itemBuilder: (context, index) {
                                                return UserVoucherComponents(
                                                    voucherModel:
                                                        snapshot.data![index]);
                                              }),
                                        ],
                                      );
                                    }
                                  });
                            }),

                            //USER BISA DIKLAIM
                            Consumer<ChallengeMainViewModel>(
                                builder: (context, state, _) {
                              return FutureBuilder(
                                  future: state.fetchVouchersToClaim(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 170,
                                                left: 29,
                                                top: 25,
                                                bottom: 15),
                                            child: Text('Kupon Potongan Harga',
                                                style: mediumBody5.copyWith()),
                                          ),
                                          ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: snapshot.data!.length,
                                              itemBuilder: (context, index) {
                                                return VoucherScreen(
                                                  voucherModel:
                                                      snapshot.data![index],
                                                );
                                              }),
                                        ],
                                      );
                                    }

                                    return VoucherPlaceholder();
                                  });
                            }),
                          ],
                        ));
            }),
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
