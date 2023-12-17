import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LeaderboardComponentStanding extends StatefulWidget {
  final LeaderboardModel leaderboardModel;
  const LeaderboardComponentStanding(
      {super.key, required this.leaderboardModel});

  @override
  State<LeaderboardComponentStanding> createState() =>
      _LeaderboardComponentStandingState();
}

class _LeaderboardComponentStandingState
    extends State<LeaderboardComponentStanding> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengeMainViewModel>(builder: (context, standing, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 9.5,
          vertical: 5,
        ),
        child: Column(
          children: [
            //PERINGKAT 1
            Consumer<ChallengeMainViewModel>(
                builder: (context, leaderboardStanding, _) {
              return FutureBuilder<LeaderboardModel?>(
                future: leaderboardStanding.fetchFirstPosition(),
                builder: (context, firstPositionSnapshot) {
                  LeaderboardModel? firstPosition = firstPositionSnapshot.data;

                  if (firstPositionSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Shimmer.fromColors(
                        baseColor: neutral00,
                        highlightColor: neutral20,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                child: SizedBox(
                                  height: 20,
                                  width: 10,
                                  child: Text('1'),
                                ),
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
                                      style: mediumBody8.copyWith(
                                          color: neutral20))),
                              const Text(' EXP', style: semiBoldBody8),
                            ],
                          ),
                        ));
                  }

                  // On error
                  else if (firstPositionSnapshot.hasError) {
                    return Text(
                        'Error: ${firstPositionSnapshot.error}'); // On error
                  }

                  //SUCCESS GET DATA BUT NO DATA INSIDE//
                  else if (!firstPositionSnapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                            width: 10,
                            child: Text('1'),
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
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('-'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('-', style: semiBoldBody5),
                          Expanded(
                              child: Text('',
                                  style:
                                      mediumBody8.copyWith(color: neutral20))),
                          const Text(
                            '- EXP',
                            style: semiBoldBody8,
                          ),
                        ],
                      ),
                    );
                  }

                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 20,
                          width: 10,
                          child: Text('1'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(
                              0xffd9d9d9,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  firstPosition!.photoProfile.toString()),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${firstPosition.name} ', style: semiBoldBody5),
                        Expanded(
                            child: Text(firstPosition.level.toString(),
                                style: mediumBody8.copyWith(color: neutral20))),
                        Text('${firstPosition.exp} EXP', style: semiBoldBody8),
                      ],
                    ),
                  );
                },
              );
            }),

            const SizedBox(
              height: 5,
            ),

            //PERINGKAT 2
            Consumer<ChallengeMainViewModel>(
                builder: (context, leaderboardStanding, _) {
              return FutureBuilder<LeaderboardModel?>(
                  future: leaderboardStanding.fetchSecondPosition(),
                  builder: (context, secondPositionSnapshot) {
                    LeaderboardModel? secondPosition =
                        secondPositionSnapshot.data;

                    if (secondPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: neutral00,
                          highlightColor: neutral20,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 10,
                                  child: Text('2'),
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
                                        style: mediumBody8.copyWith(
                                            color: neutral20))),
                                const Text(' EXP', style: semiBoldBody8),
                              ],
                            ),
                          ));
                    }

                    // On error
                    else if (secondPositionSnapshot.hasError) {
                      return Text(
                          'Error: ${secondPositionSnapshot.error}'); // On error
                    }

                    //SUCCESS GET DATA BUT NO DATA INSIDE//
                    else if (!secondPositionSnapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 10,
                              child: Text('2'),
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
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('-'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('-', style: semiBoldBody5),
                            Expanded(
                                child: Text('',
                                    style: mediumBody8.copyWith(
                                        color: neutral20))),
                            const Text(
                              '- EXP',
                              style: semiBoldBody8,
                            ),
                          ],
                        ),
                      );
                    }

                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                            width: 10,
                            child: Text('2'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(
                                0xffd9d9d9,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    secondPosition!.photoProfile.toString()),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${secondPosition.name} ', style: semiBoldBody5),
                          Expanded(
                              child: Text(secondPosition.level.toString(),
                                  style:
                                      mediumBody8.copyWith(color: neutral20))),
                          Text(
                            '${secondPosition.exp} EXP',
                            style: semiBoldBody8,
                          ),
                        ],
                      ),
                    );
                  });
            }),

            const SizedBox(
              height: 5,
            ),

            //PERINGKAT 3
            Consumer<ChallengeMainViewModel>(
                builder: (context, leaderboardStanding, _) {
              return FutureBuilder<LeaderboardModel?>(
                  future: leaderboardStanding.fetchThirdPosition(),
                  builder: (context, thirdPositionSnapshot) {
                    LeaderboardModel? thirdPosition =
                        thirdPositionSnapshot.data;

                    if (thirdPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: neutral00,
                          highlightColor: neutral20,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 10,
                                  child: Text('3'),
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
                                        style: mediumBody8.copyWith(
                                            color: neutral20))),
                                const Text(' EXP', style: semiBoldBody8),
                              ],
                            ),
                          )); // While data is loading
                    }

                    // On error
                    else if (thirdPositionSnapshot.hasError) {
                      return Text(
                          'Error: ${thirdPositionSnapshot.error}'); // On error
                    }

                    //NO DATA
                    else if (!thirdPositionSnapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 10,
                              child: Text('3'),
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
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('-'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('-', style: semiBoldBody5),
                            Expanded(
                                child: Text('',
                                    style: mediumBody8.copyWith(
                                        color: neutral20))),
                            const Text(
                              '- EXP',
                              style: semiBoldBody8,
                            ),
                          ],
                        ),
                      );
                    }

                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                            width: 10,
                            child: Text('3'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(
                                0xffd9d9d9,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    thirdPosition!.photoProfile.toString()),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${thirdPosition.name} ', style: semiBoldBody5),
                          Expanded(
                              child: Text(thirdPosition.level.toString(),
                                  style:
                                      mediumBody8.copyWith(color: neutral20))),
                          Text(
                            '${thirdPosition.exp} EXP',
                            style: semiBoldBody8,
                          ),
                        ],
                      ),
                    );
                  });
            }),

            const SizedBox(
              height: 5,
            ),

            //PERINGKAT 4
            Consumer<ChallengeMainViewModel>(
                builder: (context, leaderboardStanding, _) {
              return FutureBuilder<LeaderboardModel?>(
                  future: leaderboardStanding.fetchFourthPosition(),
                  builder: (context, fourthPositionSnapshot) {
                    LeaderboardModel? fourthPosition =
                        fourthPositionSnapshot.data;

                    if (fourthPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: neutral00,
                          highlightColor: neutral20,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 10,
                                  child: Text('4'),
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
                                        style: mediumBody8.copyWith(
                                            color: neutral20))),
                                const Text(' EXP', style: semiBoldBody8),
                              ],
                            ),
                          )); // While data is loading
                    }

                    // On error
                    else if (fourthPositionSnapshot.hasError) {
                      return Text(
                          'Error: ${fourthPositionSnapshot.error}'); // On error
                    }

                    //NO DATA
                    else if (!fourthPositionSnapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 10,
                              child: Text('4'),
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
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('-'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('-', style: semiBoldBody5),
                            Expanded(
                                child: Text('',
                                    style: mediumBody8.copyWith(
                                        color: neutral20))),
                            const Text(
                              '0 EXP',
                              style: semiBoldBody8,
                            ),
                          ],
                        ),
                      );
                    }

                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                            width: 10,
                            child: Text('4'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(
                                0xffd9d9d9,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    fourthPosition!.photoProfile.toString()),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${fourthPosition.name} ', style: semiBoldBody5),
                          Expanded(
                              child: Text(fourthPosition.level.toString(),
                                  style:
                                      mediumBody8.copyWith(color: neutral20))),
                          Text(
                            '${fourthPosition.exp} EXP',
                            style: semiBoldBody8,
                          ),
                        ],
                      ),
                    );
                  });
            }),

            const SizedBox(
              height: 5,
            ),

            //PERINGKAT 5
            Consumer<ChallengeMainViewModel>(
                builder: (context, leaderboardStanding, _) {
              return FutureBuilder<LeaderboardModel?>(
                  future: leaderboardStanding.fetchFifthPosition(),
                  builder: (context, fifthPositionSnapshot) {
                    LeaderboardModel? fifthPosition =
                        fifthPositionSnapshot.data;

                    // While data is loading
                    if (fifthPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Shimmer.fromColors(
                          baseColor: neutral00,
                          highlightColor: neutral20,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 10,
                                  child: Text('5'),
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
                                        style: mediumBody8.copyWith(
                                            color: neutral20))),
                                const Text(' EXP', style: semiBoldBody8),
                              ],
                            ),
                          ));
                    }

                    // On error
                    else if (fifthPositionSnapshot.hasError) {
                      return Text(
                          'Error: ${fifthPositionSnapshot.error}'); // On error
                    }

                    //NO DATA
                    else if (!fifthPositionSnapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 10,
                              child: Text('5'),
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
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('-'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('-', style: semiBoldBody5),
                            Expanded(
                                child: Text('',
                                    style: mediumBody8.copyWith(
                                        color: neutral20))),
                            const Text(
                              '- EXP',
                              style: semiBoldBody8,
                            ),
                          ],
                        ),
                      );
                    }

                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                            width: 10,
                            child: Text('5'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(
                                0xffd9d9d9,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    fifthPosition!.photoProfile.toString()),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${fifthPosition.name} ', style: semiBoldBody5),
                          Expanded(
                              child: Text(fifthPosition.level.toString(),
                                  style:
                                      mediumBody8.copyWith(color: neutral20))),
                          Text(
                            '${fifthPosition.exp} EXP',
                            style: semiBoldBody8,
                          ),
                        ],
                      ),
                    );
                  });
            }),
          ],
        ),
      );
    });
  }
}
