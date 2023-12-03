import 'package:disappear/screens/challenge/challenge_components.dart';
import 'package:disappear/screens/leaderboard/leaderboard_screen.dart';
import 'package:disappear/screens/voucher/voucher_screen.dart';
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
      body: Consumer<ChallengeMainViewModel>(
        builder: (context, bodyConsumer, _) {
          return ListView(
            children: [
              bodyConsumer.topButton(),
              bodyConsumer.selectedTabChallenge == 1
                  ? const ChallengComponents()
                  : bodyConsumer.selectedTabChallenge == 2
                      ? const LeaderboardScreen()
                      : const VoucherScreen(),
            ],
          );
        },
      ),
    );
  }
}
