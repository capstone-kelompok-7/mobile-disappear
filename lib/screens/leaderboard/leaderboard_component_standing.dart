import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
                    LeaderboardModel? firstPosition =
                        firstPositionSnapshot.data;

                    if (firstPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator(); // While data is loading
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
                          Container(
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
                                  style:
                                      mediumBody8.copyWith(color: neutral20))),
                          Text(
                            '${firstPosition.exp} EXP',
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),

            Divider(
              thickness: 1,
              height: 1,
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
                      return CircularProgressIndicator(); // While data is loading
                    }
                    // On error
                    else if (secondPositionSnapshot.hasError) {
                      return Text(
                          'Error: ${secondPositionSnapshot.error}'); // On error
                    } else if (!secondPositionSnapshot.hasData) {
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
                            Container(
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
                                  image: NetworkImage('-'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('-', style: semiBoldBody5),
                            Expanded(
                                child: Text('',
                                    style: mediumBody8.copyWith(
                                        color: neutral20))),
                            Text(
                              '0 EXP',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
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
                          Container(
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
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),

            Divider(
              thickness: 1,
              height: 1,
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
                      return CircularProgressIndicator(); // While data is loading
                    }

                    if (thirdPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator(); // While data is loading
                    }
                    // On error
                    else if (thirdPositionSnapshot.hasError) {
                      return Text(
                          'Error: ${thirdPositionSnapshot.error}'); // On error
                    } else if (!thirdPositionSnapshot.hasData) {
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
                            Container(
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
                                  image: NetworkImage('-'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('-', style: semiBoldBody5),
                            Expanded(
                                child: Text('',
                                    style: mediumBody8.copyWith(
                                        color: neutral20))),
                            Text(
                              '0 EXP',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
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
                          Container(
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
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),

            Divider(
              thickness: 1,
              height: 1,
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
                      return CircularProgressIndicator(); // While data is loading
                    }

                    if (fourthPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator(); // While data is loading
                    }

                    if (fourthPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator(); // While data is loading
                    }
                    // On error
                    else if (fourthPositionSnapshot.hasError) {
                      return Text(
                          'Error: ${fourthPositionSnapshot.error}'); // On error
                    } else if (!fourthPositionSnapshot.hasData) {
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
                            Container(
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
                                  image: NetworkImage('-'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('-', style: semiBoldBody5),
                            Expanded(
                                child: Text('',
                                    style: mediumBody8.copyWith(
                                        color: neutral20))),
                            Text(
                              '0 EXP',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
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
                          Container(
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
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),

            Divider(
              thickness: 1,
              height: 1,
            ),

            //PERINGKAT 5
            Consumer<ChallengeMainViewModel>(
                builder: (context, leaderboardStanding, _) {
              return FutureBuilder<LeaderboardModel?>(
                  future: leaderboardStanding.fetchFifthPosition(),
                  builder: (context, fifthPositionSnapshot) {
                    LeaderboardModel? fifthPosition =
                        fifthPositionSnapshot.data;

                    if (fifthPositionSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator(); // While data is loading
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
                            Container(
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
                                  image: NetworkImage('-'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('-', style: semiBoldBody5),
                            Expanded(
                                child: Text('',
                                    style: mediumBody8.copyWith(
                                        color: neutral20))),
                            Text(
                              '0 EXP',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
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
                          Container(
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
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),

            //BELUM TERPAKAI (TAMPILAN SEBELUM CONSUMER)
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(8),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.2),
            //         spreadRadius: 0.5,
            //         offset: const Offset(0, 3),
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         height: 20,
            //         width: 10,
            //         child: Text('5'),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Container(
            //         width: 25,
            //         height: 25,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: const Color(
            //             0xffd9d9d9,
            //           ),
            //           image: DecorationImage(
            //             fit: BoxFit.cover,
            //             image: NetworkImage(
            //                 widget.leaderboardModel.photoProfile.toString()),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 5,
            //       ),
            //       Text('${widget.leaderboardModel.name.toString()} ',
            //           style: semiBoldBody5),
            //       Expanded(
            //           child: Text(widget.leaderboardModel.level.toString(),
            //               style: mediumBody8.copyWith(color: neutral20))),
            //       Text(
            //         '${widget.leaderboardModel.exp.toString()} EXP',
            //         style: GoogleFonts.inter().copyWith(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 10,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
