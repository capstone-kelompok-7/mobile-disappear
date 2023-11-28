import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:disappear/themes/color_scheme.dart';

class EnvironmentalIssuesScreen extends StatefulWidget {
  static const String routePath = '/environmental-issues';
  const EnvironmentalIssuesScreen({super.key});

  @override
  State<EnvironmentalIssuesScreen> createState() =>
      _EnvironmentalIssuesScreenState();
}

List<Map<String, dynamic>> issues = [
  {
    'imageUrl': 'assets/img/pencemaran_air.png',
    'issue': 'Pencemaran\nair',
  },
  {
    'imageUrl': 'assets/img/pencemaran_udara.png',
    'issue': 'Pencemaran\nudara',
  },
  {
    'imageUrl': 'assets/img/penebangan_pohon.png',
    'issue': 'Penebangan\npohon',
  },
  {
    'imageUrl': 'assets/img/sampah_plastik.png',
    'issue': 'Sampah\nplastik',
  },
  {
    'imageUrl': 'assets/img/bencana_alam.png',
    'issue': 'Bencana\nalam',
  },
  {
    'imageUrl': 'assets/img/limbah_b3.png',
    'issue': 'Limbah B3',
  },
  {
    'imageUrl': 'assets/img/perubahan_iklim.png',
    'issue': 'Perubahan\niklim',
  },
  {
    'imageUrl': 'assets/img/pencemaran_tanah.png',
    'issue': 'Pencemaran\ntanah',
  },
  {
    'imageUrl': 'assets/img/krisis_air.png',
    'issue': 'Krisis air',
  },
];

class _EnvironmentalIssuesScreenState extends State<EnvironmentalIssuesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary00,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 23,
            ),
            child: Column(
              children: [
                Text(
                  'ISU LINGKUNGAN',
                  style: boldBody1.copyWith(
                    color: primary40,
                  ),
                ),
                Text(
                  'Pilihlah isu lingkungan yang kamu sukai\natau yang kamu minati',
                  style: mediumBody7.copyWith(
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 45,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  issues[index]['imageUrl'].toString(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            issues[index]['issue'].toString(),
                            style: mediumBody8.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primary30),
                    minimumSize: MaterialStatePropertyAll(
                      Size(295, 44),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Selanjutnya',
                    style: semiBoldBody4.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
