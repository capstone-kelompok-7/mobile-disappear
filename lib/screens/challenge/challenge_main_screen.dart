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
  static
  const String routePath = '/challenge-main-screen';
  const ChallengeMainScreen({
    super.key
  });

  @override
  State < ChallengeMainScreen > createState() => _ChallengeMainScreenState();
}

class _ChallengeMainScreenState extends State < ChallengeMainScreen > {
  late Future _userVoucherFuture;

  late Future _userVoucherToClaimFuture;

  @override
  void initState() {
    final challengeProvider = Provider.of < ChallengeMainViewModel > (context, listen: false);

    _userVoucherFuture = challengeProvider.fetchUserVoucher();
    _userVoucherToClaimFuture = challengeProvider.fetchVouchersToClaim();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        elevation: 2.5,
        automaticallyImplyLeading: false,
        title: Consumer < ChallengeMainViewModel > (
          builder: (context, appBar, _) {
            return appBar.selectedTabChallenge == 1 ?
              Text('Tantangan', style: semiBoldBody1.copyWith(color: whiteColor)) :
              appBar.selectedTabChallenge == 2 ?
              Text('Leaderboard', style: semiBoldBody1.copyWith(color: whiteColor)) :
              Text('Kuponku', style: semiBoldBody1.copyWith(color: whiteColor));
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer < ChallengeMainViewModel > (
            builder: (context, bodyConsumer, _) {
              return SizedBox(
                child: bodyConsumer.topButton(),
              );
            },
          ),
          const SizedBox(
              height: 5,
            ),
            Consumer < ChallengeMainViewModel > (
              builder: (context, bodyConsumer, _) {
                if (bodyConsumer.selectedTabChallenge == 1) {
                  return Expanded(
                    child: FutureBuilder(
                      future: bodyConsumer.fetchAllChallenge(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return const ChallengePlaceholder();
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                          snapshot.data!.isEmpty) {
                          return const Text('Tidak ada Tantangan Tersedia');
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
                  );
                }

                if (bodyConsumer.selectedTabChallenge == 2) {
                  return Expanded(
                    child: FutureBuilder(
                      future: bodyConsumer.fetchLeaderboard(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                          return const LeaderboardPlaceholder();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                          snapshot.data!.isEmpty) {
                          return const Text('Tidak ada Leaderboard Tersedia');
                        } else {
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              LeaderboardComponentPodium(
                                leaderboardModel: snapshot.data![0]),
                              const SizedBox(
                                height: 30,
                              ),
                              LeaderboardComponentStanding(
                                leaderboardModel: snapshot.data![0])
                            ],
                          );
                        }
                      }),
                  );
                }
                
                return Expanded(
                  child: ListView(
                    children: [
                      //voucher SAYA (sudah klaim)
                      Consumer < ChallengeMainViewModel > (
                        builder: (context, state, _) {
                          return FutureBuilder(
                            future: _userVoucherFuture,
                            builder: (context, snapshot) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                    child: Text('Kupon Saya', style: mediumBody5.copyWith()),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Column(children: [VoucherPlaceholder()]);
                                      } else if (snapshot.hasError) {
                                        return const Center(child: Text('Tidak ada Kupon Tersedia'));
                                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                        const Center(child: Text('Tidak ada Kupon Tersedia'));
                                      }

                                      return ListView.separated(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        separatorBuilder: (context, index) => const SizedBox(height: 10,),
                                        itemBuilder: (context, index) {
                                          return UserVoucherComponents(
                                            voucherModel:
                                            snapshot.data![index]
                                          );
                                        }
                                      );
                                    }
                                  ),
                                ],
                              );
                              
                            });
                        }),

                      //USER BISA DIKLAIM
                      Consumer < ChallengeMainViewModel > (
                        builder: (context, state, _) {
                          return FutureBuilder(
                            future: _userVoucherToClaimFuture,
                            builder: (context, snapshot) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                    child: Text('Kupon Potongan Harga', style: mediumBody5.copyWith()),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (snapshot.hasError) {
                                        return const Text('Tidak ada kupon untuk diklaim');
                                      } else if (snapshot.hasData) {
                                        return ListView.separated(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length,
                                          separatorBuilder: (context, index) => const SizedBox(height: 10,),
                                          itemBuilder: (context, index) {
                                            return VoucherScreen(
                                              voucherModel:
                                              snapshot.data![index],
                                            );
                                          }
                                        );
                                      }

                                      return const VoucherPlaceholder();
                                    }
                                  ),
                                ],
                              );
                            });
                        }),
                    ],
                  ));
              }),
        ],
      )
    );
  }
}