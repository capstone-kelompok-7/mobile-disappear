import 'package:disappear/screens/challenge/challenge_screen.dart';
import 'package:disappear/screens/article_screen.dart';
import 'package:disappear/screens/category/categories_screen.dart';
import 'package:disappear/screens/change_password_screen.dart';
import 'package:disappear/screens/detail_article_screen.dart';
import 'package:disappear/screens/detail_challenge_screen.dart';
import 'package:disappear/screens/detail_order_screen.dart';
import 'package:disappear/screens/home/home_screen.dart';
import 'package:disappear/screens/auth/forgot_password_screen.dart';
import 'package:disappear/screens/leaderboard/leaderboard_screen.dart';
import 'package:disappear/screens/join_challenge_screen.dart';
import 'package:disappear/screens/auth/login_screen.dart';
import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/screens/new_password_screen.dart';
import 'package:disappear/screens/product_review/add_review_screen.dart';
import 'package:disappear/screens/notification/notification_screen.dart';
import 'package:disappear/screens/onboarding/onboarding_screen.dart';
import 'package:disappear/screens/product_screen.dart';
import 'package:disappear/screens/profile/edit_profile_screen.dart';
import 'package:disappear/screens/profile/profile_screen.dart';
import 'package:disappear/screens/register_screen.dart';
import 'package:disappear/screens/search_product/search_product_screen.dart';
import 'package:disappear/screens/save_article_sreen.dart';
import 'package:disappear/screens/splash_screen.dart';
import 'package:disappear/screens/success_email_verification.dart';
import 'package:disappear/screens/success_new_pasword_screen.dart';
import 'package:disappear/screens/verification_email_screen.dart';
import 'package:disappear/screens/auth/forgot_password_verification_screen.dart';
import 'package:disappear/screens/voucher/voucher_screen.dart';
import 'package:disappear/screens/product_review/product_reviews_screen.dart';
import 'package:disappear/screens/wishlist/wishlist_screen.dart';

import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/theme.dart';
import 'package:disappear/view_models/auth/forgot_password_view_model.dart';
import 'package:disappear/view_models/auth/forgot_password_verification_view_model.dart';
import 'package:disappear/view_models/auth/login_view_model.dart';
import 'package:disappear/view_models/product_review/add_product_review_view_model.dart';
import 'package:disappear/view_models/onboarding/onboarding_view_model.dart';
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
      ChangeNotifierProvider(
        create: (context) => OnboardingViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => ForgotPasswordViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AddProductReviewViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => ForgotPasswordVerificationViewModel(),
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
      initialRoute: ForgotPasswordScreen.routePath,
      routes: {
        SplashScreen.routePath: (context) => const SplashScreen(),
        OnboardingScreen.routePath: (context) => const OnboardingScreen(),
        MainScreen.routePath: (context) => const MainScreen(),
        HomeScreen.routePath: (context) => const HomeScreen(),
        NotificationScreen.routePath: (context) => const NotificationScreen(),
        CategoriesScreen.routePath: (context) => const CategoriesScreen(),
        ForgotPasswordScreen.routePath: (context) =>
            const ForgotPasswordScreen(),
        ForgotPasswordVerificationScreen.routePath: (context) =>
            const ForgotPasswordVerificationScreen(),
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
        ChallengeScreen.routePath: (context) => const ChallengeScreen(),
        LoginScreen.routePath: (context) => const LoginScreen(),
        RegisterScreen.routePath: (context) => RegisterScreen(),
        ArticleScreen.routePath: (context) => const ArticleScreen(),
        VoucherScreen.routePath: (context) => const VoucherScreen(),
        LeaderboardScreen.routePath: (context) => const LeaderboardScreen(),
        SearchProductScreen.routePath: (context) => const SearchProductScreen(),
        ProductReviewsScreen.routePath: (context) =>
            const ProductReviewsScreen(),
        DetailArticleScreen.routePath: (context) => DetailArticleScreen(),
        SaveArticleScreen.routePath: (context) => const SaveArticleScreen(),
        WishListScreen.routePath: (context) => const WishListScreen(),
        DetailOrderScreen.routePath: (context) => const DetailOrderScreen(),
        ProfileScreen.routePath: (context) => const ProfileScreen(),
        EditProfileScreen.routePath: (context) => const EditProfileScreen(),
        ProductScreen.routePath: (context) => const ProductScreen(),
        ChangePasswordScreen.routePath: (context) =>
            const ChangePasswordScreen(),
        AddReviewScreen.routePath: (context) => const AddReviewScreen(),
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
