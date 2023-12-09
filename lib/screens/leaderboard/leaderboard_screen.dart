import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LeaderboardComponentPodium extends StatefulWidget {
  final LeaderboardModel leaderboardModel;
  const LeaderboardComponentPodium({super.key, required this.leaderboardModel});

  @override
  State<LeaderboardComponentPodium> createState() => _LeaderboardComponentPodiumState();
}

// List<Map<String, dynamic>> expLeaderboard = [
//   {
//     'number': 1,
//     'imageUrl':
//         'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699833600&semt=ais',
//     'name': 'Daud',
//     'exp': 2000,
//   },
//   {
//     'number': 2,
//     'imageUrl':
//         'https://img.freepik.com/free-photo/smiley-man-relaxing-outdoors_23-2148739334.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699833600&semt=sph',
//     'name': 'Faza',
//     'exp': 1500,
//   },
//   {
//     'number': 3,
//     'imageUrl':
//         'https://images.unsplash.com/photo-1615109398623-88346a601842?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
//     'name': 'Rudi',
//     'exp': 1000,
//   },
//   {
//     'number': 3,
//     'imageUrl':
//         'https://images.unsplash.com/photo-1615109398623-88346a601842?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
//     'name': 'Rudi',
//     'exp': 1000,
//   },
//   {
//     'number': 3,
//     'imageUrl':
//         'https://images.unsplash.com/photo-1615109398623-88346a601842?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
//     'name': 'Rudi',
//     'exp': 1000,
//   },
//   {
//     'number': 3,
//     'imageUrl':
//         'https://images.unsplash.com/photo-1615109398623-88346a601842?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
//     'name': 'Rudi',
//     'exp': 1000,
//   },
//   {
//     'number': 3,
//     'imageUrl':
//         'https://images.unsplash.com/photo-1615109398623-88346a601842?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
//     'name': 'Rudi',
//     'exp': 1000,
//   },
//   {
//     'number': 3,
//     'imageUrl':
//         'https://images.unsplash.com/photo-1615109398623-88346a601842?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
//     'name': 'Rudi',
//     'exp': 1000,
//   },
// ];

class _LeaderboardComponentPodiumState extends State<LeaderboardComponentPodium> {
  @override
  Widget build(BuildContext context) {
    Widget leaderboard() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 72,
          right: 72,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Text(
                          '-',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '2 nd',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '-',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
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
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
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
                              Text(
                                '2 nd',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${secondPosition.exp.toString()} EXP',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
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
                        Text(
                          '-',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '1 st',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '-',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
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
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
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
                              Text(
                                '1 st',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${firstPosition.exp.toString()} EXP',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
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
                        Text(
                          '-',
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 90,
                          width: 70,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 204, 204, 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '3 rd',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '-',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
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
                          style: GoogleFonts.inter().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
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
                              Text(
                                '3 rd',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${thirdPosition.exp} EXP',
                                style: GoogleFonts.inter().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
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
        ),
      );
    }

    // Widget listExp() {
    //   // leaderboards
    //   //  List<LeaderboardModel> leaderboardList = await fetchLeaderboard();
    //   // int index = Provider.of<ChallengeMainViewModel>(context)
    //   //     .leaderboardList
    //   //     .indexWhere((item) => item.id == widget.leaderboardModel.id);
    //    Increment the index by 1 to display as 1-based counting instead of 0-based
    //   int displayIndex = index + 1;
    //   return Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 9.5,
    //       vertical: 5,
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(8),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey.withOpacity(0.2),
    //             spreadRadius: 0.5,
    //             offset: const Offset(0, 3),
    //           ),
    //         ],
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Container(
    //               height: 20,
    //               width: 10,
    //               child: Text(widget.leaderboardModel.id.toString())),
    //           const SizedBox(
    //             width: 10,
    //           ),
    //           Container(
    //             width: 25,
    //             height: 25,
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               color: const Color(
    //                 0xffd9d9d9,
    //               ),
    //               image: DecorationImage(
    //                 fit: BoxFit.cover,
    //                 image: NetworkImage(
    //                     widget.leaderboardModel.photoProfile.toString()),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 5,
    //           ),
    //           Expanded(
    //             child: Text(
    //               '${widget.leaderboardModel.name.toString()}',
    //               style: GoogleFonts.inter().copyWith(
    //                 fontWeight: FontWeight.w600,
    //                 fontSize: 12,
    //               ),
    //             ),
    //           ),
    //           Text(
    //             '${widget.leaderboardModel.exp.toString()} EXP',
    //             style: GoogleFonts.inter().copyWith(
    //               fontWeight: FontWeight.w600,
    //               fontSize: 10,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    return leaderboard();
  }
}
