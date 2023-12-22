import 'package:disappear/screens/challenge/challenge_components.dart';
import 'package:disappear/screens/challenge/challenge_placeholder.dart';
import 'package:disappear/screens/leaderboard/leaderboard_standing.dart';
import 'package:disappear/screens/leaderboard/leaderboard_placeholder.dart';
import 'package:disappear/screens/leaderboard/leaderboard_podium.dart';
import 'package:disappear/screens/voucher/user_voucher.dart';
import 'package:disappear/screens/voucher/voucher_placeholder.dart';
import 'package:disappear/screens/voucher/claimable_voucher.dart';
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
  @override
  void initState() {
    final challengeProvider = Provider.of < ChallengeMainViewModel > (context, listen: false);
    
    challengeProvider.fetchVouchers();
    
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
            if (appBar.selectedTabChallenge == 1) {
              return Text('Tantangan', style: semiBoldBody1.copyWith(color: whiteColor));
            }

            if (appBar.selectedTabChallenge == 2) {
              return Text('Leaderboard', style: semiBoldBody1.copyWith(color: whiteColor));
            }
            
            return Text('Kuponku', style: semiBoldBody1.copyWith(color: whiteColor));
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer < ChallengeMainViewModel > (
            builder: (context, bodyConsumer, _) {
              return Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: primary40,
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        bodyConsumer.selectedTabChallenge = 1;
                      },
                      child: Container(
                        width: 72,
                        height: 20,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: bodyConsumer.selectedTabChallenge == 1
                            ? BoxDecoration(
                                color: secondary00,
                                borderRadius: BorderRadius.circular(4)
                              )
                            : null,
                        child: Text('Tantangan',
                            style: bodyConsumer.selectedTabChallenge == 1
                                ? semiBoldBody8
                                : semiBoldBody8.copyWith(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        bodyConsumer.selectedTabChallenge = 2;
                      },
                      child: Container(
                        width: 85,
                        height: 20,
                        padding: const EdgeInsets.only(
                          left: 8,
                          top: 2,
                          bottom: 2,
                        ),
                        decoration: bodyConsumer.selectedTabChallenge == 2
                            ? BoxDecoration(
                                color: secondary00,
                                borderRadius: BorderRadius.circular(4)
                              )
                            : null,
                        child: Text('Leaderboard',
                            style: bodyConsumer.selectedTabChallenge == 2
                                ? semiBoldBody8
                                : semiBoldBody8.copyWith(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        bodyConsumer.selectedTabChallenge = 3;
                      },
                      child: Container(
                        width: 65,
                        height: 20,
                        padding: const EdgeInsets.only(left: 10, top: 2),
                        decoration: bodyConsumer.selectedTabChallenge == 3
                            ? BoxDecoration(
                                color: secondary00,
                                borderRadius: BorderRadius.circular(4)
                              )
                            : null,
                        child: Text(
                          'Kuponku',
                          style: bodyConsumer.selectedTabChallenge == 3
                              ? semiBoldBody8
                              : semiBoldBody8.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 5),
          Consumer < ChallengeMainViewModel > (
            builder: (context, bodyConsumer, _) {
              if (bodyConsumer.selectedTabChallenge == 1) {
                return Expanded(
                  child: FutureBuilder(
                    future: bodyConsumer.fetchAllChallenge(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            separatorBuilder: (context, index) => const SizedBox(height: 10,),
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
                        return ListView.separated(
                          padding: const EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 10,),
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LeaderboardPlaceholder();
                      }

                      if (snapshot.hasData) {
                        return ListView(
                          padding: const EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          children: [
                            LeaderboardPodium(leaderboard: snapshot.data!),
                            const SizedBox(height: 30),
                            LeaderboardStanding(leaderboard: snapshot.data!)
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    }
                  ),
                );
              }
              
              return Expanded(
                child: ListView(
                  children: [
                    //voucher SAYA (sudah klaim)
                    Consumer < ChallengeMainViewModel > (
                      builder: (context, state, _) {
                        return FutureBuilder(
                          future: state.userVoucherFuture,
                          builder: (context, snapshot) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                                  child: Text('Kupon Saya', style: mediumBody5.copyWith()),
                                ),
                                Builder(
                                  builder: (context) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const VoucherPlaceholder();
                                    }
                                    
                                    if (snapshot.hasError) {
                                      return const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 30),
                                        child: Text('Tidak ada kupon tersedia'),
                                      );
                                    }

                                    return ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      separatorBuilder: (context, index) => const SizedBox(height: 10,),
                                      itemBuilder: (context, index) {
                                        return UserVoucher(
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
                          future: state.userVoucherToClaimFuture,
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
                                      return const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 30),
                                        child: Text('Tidak ada kupon untuk diklaim'),
                                      );
                                    } else if (snapshot.hasData) {
                                      if (snapshot.data!.isNotEmpty) {
                                        return ListView.separated(
                                          padding: const EdgeInsets.only(bottom: 20),
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length,
                                          separatorBuilder: (context, index) => const SizedBox(height: 10,),
                                          itemBuilder: (context, index) {
                                            return ClaimableVoucher(
                                              voucherModel:
                                              snapshot.data![index],
                                            );
                                          }
                                        );
                                      }
                                      
                                      return const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 30),
                                        child: Text('Tidak ada kupon untuk diklaim'),
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
            }
          ),
        ],
      )
    );
  }
}