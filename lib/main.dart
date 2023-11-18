import 'package:disappear/screens/challenge/challenge_screen.dart';
import 'package:disappear/screens/article_screen.dart';
import 'package:disappear/screens/category/categories_screen.dart';
import 'package:disappear/screens/detail_article_screen.dart';
import 'package:disappear/screens/detail_challenge_screen.dart';
import 'package:disappear/screens/home/home_screen.dart';
import 'package:disappear/screens/forgot_password_screen.dart';
import 'package:disappear/screens/leaderboard/leaderboard_screen.dart';
import 'package:disappear/screens/join_challenge_screen.dart';
import 'package:disappear/screens/login_screen.dart';
import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/screens/new_password_screen.dart';
import 'package:disappear/screens/profile/edit_profile_screen.dart';
import 'package:disappear/screens/profile/profile_screen.dart';
import 'package:disappear/screens/register_screen.dart';
import 'package:disappear/screens/search_product/search_product_screen.dart';
import 'package:disappear/screens/save_article_sreen.dart';
import 'package:disappear/screens/splash_screen.dart';
import 'package:disappear/screens/success_email_verification.dart';
import 'package:disappear/screens/success_new_pasword_screen.dart';
import 'package:disappear/screens/verification_email_screen.dart';
import 'package:disappear/screens/verification_forgot_password_screen.dart';
import 'package:disappear/screens/voucher/voucher_screen.dart';
import 'package:disappear/screens/product_review/product_reviews_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/theme.dart';
import 'package:disappear/view_models/auth/login_view_model.dart';
import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_history_view_model.dart';
import 'package:disappear/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MainViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchHistoryViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchFieldViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
      ),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ProfileScreen.routePath,
      routes: {
        SplashScreen.routePath: (context) => const SplashScreen(),
        MainScreen.routePath: (context) => const MainScreen(),
        HomeScreen.routePath: (context) => const HomeScreen(),
        CategoriesScreen.routePath: (context) => const CategoriesScreen(),
        ForgotPasswordScreen.routePath: (context) =>
            const ForgotPasswordScreen(),
        VerificationForgotPasswordScreen.routePath: (context) =>
            const VerificationForgotPasswordScreen(),
        VerificationEmailScreen.routePath: (context) =>
            const VerificationEmailScreen(),
        DetailChallengeScreen.routePath: (context) =>
            const DetailChallengeScreen(),
        NewPasswordScreen.routePath: (context) => const NewPasswordScreen(),
        JoinChallengeScreen.routePath: (context) => const JoinChallengeScreen(),
        SuccessNewPasswordScreen.routePath: (context) =>
            const SuccessNewPasswordScreen(),
        SuccessEmailVerificationScreen.routePath: (context) =>
            const SuccessEmailVerificationScreen(),
        ChallengeScreen.routePath: (context) => ChallengeScreen(),
        LoginScreen.routePath: (context) => LoginScreen(),
        RegisterScreen.routePath: (context) => RegisterScreen(),
        ArticleScreen.routePath: (context) => const ArticleScreen(),
        VoucherScreen.routePath: (context) => const VoucherScreen(),
        LeaderboardScreen.routePath: (context) => LeaderboardScreen(),
        SearchProductScreen.routePath: (context) => const SearchProductScreen(),
        ProductReviewsScreen.routePath: (context) =>
            const ProductReviewsScreen(),
        DetailArticleScreen.routePath: (context) => DetailArticleScreen(),
        SaveArticleScreen.routePath: (context) => const SaveArticleScreen(),
        ProfileScreen.routePath:(context) => const ProfileScreen(),
        EditProfileScreen.routePath:(context) => const EditProfileScreen(),

      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: colorScheme,
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedButtonTheme,
      ),
    );
  }
}
