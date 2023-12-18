import 'package:disappear/screens/article/article_screen.dart';
import 'package:disappear/screens/article/detail_article_screen.dart';
import 'package:disappear/screens/article/save_article_sreen.dart';
import 'package:disappear/screens/auth/register/register_verification_screen.dart';
import 'package:disappear/screens/challenge/challenge_main_screen.dart';
import 'package:disappear/screens/category/categories_screen.dart';
import 'package:disappear/screens/challenge/detail_challenge_screen.dart';
import 'package:disappear/screens/challenge/join_challenge_screen.dart';
import 'package:disappear/screens/chatbot/chatbot_empty_screen.dart';
import 'package:disappear/screens/chatbot/chatbot_screen.dart';
import 'package:disappear/screens/address/add_new_address_screen.dart';
import 'package:disappear/screens/checkout/address/checkout_address_screen.dart';
import 'package:disappear/screens/address/address_list_screen.dart';
import 'package:disappear/screens/checkout/checkout_screen.dart';
import 'package:disappear/screens/checkout/choose_transport_screen.dart';
import 'package:disappear/screens/address/edit_old_address_screen.dart';
import 'package:disappear/screens/checkout/payment_method/ewallet_transfer_screen.dart';
import 'package:disappear/screens/checkout/payment_method/manual_transfer_screen.dart';
import 'package:disappear/screens/checkout/use_coupon_screen.dart';
import 'package:disappear/screens/home/home_screen.dart';
import 'package:disappear/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:disappear/screens/auth/login_screen.dart';
import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/screens/checkout/payment/gopay_screen.dart';
import 'package:disappear/screens/checkout/payment/telegram_transfer_screen.dart';
import 'package:disappear/screens/order_detail/detail_order_screen.dart';
import 'package:disappear/screens/order_list/order_list_screen.dart';
import 'package:disappear/screens/checkout/payment/whatsapp_transfer_screen.dart';
import 'package:disappear/screens/auth/forgot_password/new_password_screen.dart';
import 'package:disappear/screens/product/product_reviews_screen.dart';
import 'package:disappear/screens/product/product_screen.dart';
import 'package:disappear/screens/product_review/add_review_screen.dart';
import 'package:disappear/screens/notification/notification_screen.dart';
import 'package:disappear/screens/onboarding/onboarding_screen.dart';
import 'package:disappear/screens/profile/change_password_screen.dart';
import 'package:disappear/screens/profile/edit_profile_screen.dart';
import 'package:disappear/screens/profile/profile_screen.dart';
import 'package:disappear/screens/auth/register/register_screen.dart';
import 'package:disappear/screens/search_product/search_product_screen.dart';
import 'package:disappear/screens/splash_screen.dart';
import 'package:disappear/screens/auth/forgot_password/forgot_password_verification_screen.dart';
import 'package:disappear/screens/cart/cart_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/theme.dart';
import 'package:disappear/timeago_message.dart';
import 'package:disappear/view_models/address/address_view_model.dart';
import 'package:disappear/view_models/article/detail_articles_view_model.dart';
import 'package:disappear/view_models/article/bookmark_view_model.dart';
import 'package:disappear/view_models/article/carousel_article_view_model.dart';
import 'package:disappear/view_models/article/filter_article_view_model.dart';
import 'package:disappear/view_models/article/get_article_view_model.dart';
import 'package:disappear/view_models/auth/forgot_password/forgot_password_view_model.dart';
import 'package:disappear/view_models/auth/forgot_password/forgot_password_verification_view_model.dart';
import 'package:disappear/view_models/auth/forgot_password/new_password_view_model.dart';
import 'package:disappear/view_models/auth/login_view_model.dart';
import 'package:disappear/view_models/auth/logout_view_model.dart';
import 'package:disappear/view_models/auth/register/register_verification_view_model.dart';
import 'package:disappear/view_models/auth/register/register_view_model.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:disappear/view_models/cart/cart_view_model.dart';
import 'package:disappear/view_models/chatbot/chatbot_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_address_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_payment_method_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_voucher_view_model.dart';
import 'package:disappear/view_models/checkout/gopay_view_model.dart';
import 'package:disappear/view_models/checkout/manual_transfer_view_model.dart';
import 'package:disappear/view_models/home/home_view_model.dart';
import 'package:disappear/view_models/category/category_view_model.dart';
import 'package:disappear/view_models/home/home_category_view_model.dart';
import 'package:disappear/view_models/home/carousel_view_model.dart';
import 'package:disappear/view_models/home/best_seller_product_view_model.dart';
import 'package:disappear/view_models/home/latest_articles_view_model.dart';
import 'package:disappear/view_models/notification/notification_view_model.dart';
import 'package:disappear/view_models/order/order_view_model.dart';
import 'package:disappear/view_models/product/add_to_cart_view_model.dart';
import 'package:disappear/view_models/product/product_carousel_view_model.dart';
import 'package:disappear/view_models/product/product_review_view_model.dart';
import 'package:disappear/view_models/product/product_view_model.dart';
import 'package:disappear/view_models/product_review/add_product_review_view_model.dart';
import 'package:disappear/view_models/onboarding/onboarding_view_model.dart';
import 'package:disappear/view_models/profile/change_password_view_model.dart';
import 'package:disappear/view_models/profile/user_profile_view_model.dart';
import 'package:disappear/view_models/search_product/filter_view_model.dart';
import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_history_view_model.dart';
import 'package:disappear/view_models/main_view_model.dart';
import 'package:disappear/view_models/search_product/search_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await initializeDateFormatting('id');

  Intl.systemLocale = 'id';

  timeago.setLocaleMessages('id', IndonesianMessage());
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainViewModel()),
      ChangeNotifierProvider(create: (context) => SearchHistoryViewModel()),
      ChangeNotifierProvider(create: (context) => SearchFieldViewModel()),
      ChangeNotifierProvider(create: (context) => SearchProductViewModel()),
      ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ChangeNotifierProvider(create: (context) => OnboardingViewModel()),
      ChangeNotifierProvider(create: (context) => ForgotPasswordViewModel()),
      ChangeNotifierProvider(create: (context) => AddProductReviewViewModel()),
      ChangeNotifierProvider(create: (context) => ForgotPasswordVerificationViewModel()),
      ChangeNotifierProvider(create: (context) => NewPasswordViewModel()),
      ChangeNotifierProvider(create: (context) => RegisterViewModel()),
      ChangeNotifierProvider(create: (context) => RegisterVerificationViewModel()),
      ChangeNotifierProvider(create: (context) => HomeCategoryViewModel()),
      ChangeNotifierProvider(create: (context) => CategoryViewModel()),
      ChangeNotifierProvider(create: (context) => ChallengeMainViewModel()),
      ChangeNotifierProvider(create: (context) => CarouselViewModel()),
      ChangeNotifierProvider(create: (context) => BestSellerProductViewModel()),
      ChangeNotifierProvider(create: (context) => OrderViewModel()),
      ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ChangeNotifierProvider(create: (context) => CheckoutViewModel()),
      ChangeNotifierProvider(create: (context) => CheckoutVoucherViewModel()),
      ChangeNotifierProvider(create: (context) => CheckoutAddressViewModel()),
      ChangeNotifierProvider(create: (context) => CheckoutPaymentMethodViewModel()),
      ChangeNotifierProvider(create: (context) => CheckoutPaymentMethodViewModel()),
      ChangeNotifierProvider(create: (context) => DetailArticlesViewModel()),
      ChangeNotifierProvider(create: (context) => ArticleFilterViewModel()),
      ChangeNotifierProvider(create: (context) => CarouselArticleViewModel()),
      ChangeNotifierProvider(create: (context) => GetArticleViewModel()),
      ChangeNotifierProvider(create: (context) => CartViewModel()),
      ChangeNotifierProvider(create: (context) => ManualTransferViewModel()),
      ChangeNotifierProvider(create: (context) => LatestArticlesViewModel()),
      ChangeNotifierProvider(create: (context) => ProductViewModel()),
      ChangeNotifierProvider(create: (context) => AddToCartViewModel()),
      ChangeNotifierProvider(create: (context) => FilterViewModel()),
      ChangeNotifierProvider(create: (context) => ProductCarouselViewModel()),
      ChangeNotifierProvider(create: (context) => ProductReviewViewModel()),
      ChangeNotifierProvider(create: (context) => BookmarkViewModel()),
      ChangeNotifierProvider(create: (context) => GopayViewModel()),
      ChangeNotifierProvider(create: (context) => ProfileViewModel()),
      ChangeNotifierProvider(create: (context) => ChatbotViewModel()),
      ChangeNotifierProvider(create: (context) => ChangePasswordViewModel()),
      ChangeNotifierProvider(create: (context) => AddressViewModel()),
      ChangeNotifierProvider(create: (context) => LogoutViewModel()),
      ChangeNotifierProvider(create: (context) => NotificationViewModel()),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routePath,
      navigatorKey: navigatorKey,
      routes: {
        SplashScreen.routePath: (context) => const SplashScreen(),
        OnboardingScreen.routePath: (context) => const OnboardingScreen(),
        MainScreen.routePath: (context) => const MainScreen(),
        HomeScreen.routePath: (context) => const HomeScreen(),
        NotificationScreen.routePath: (context) => const NotificationScreen(),
        CategoriesScreen.routePath: (context) => const CategoriesScreen(),
        ForgotPasswordScreen.routePath: (context) => const ForgotPasswordScreen(),
        ForgotPasswordVerificationScreen.routePath: (context) => const ForgotPasswordVerificationScreen(),
        RegisterVerificationScreen.routePath: (context) => const RegisterVerificationScreen(),
        DetailChallengeScreen.routePath: (context) => const DetailChallengeScreen(),
        NewPasswordScreen.routePath: (context) => const NewPasswordScreen(),
        JoinChallengeScreen.routePath: (context) => const JoinChallengeScreen(),
        ChallengeMainScreen.routePath: (context) => const ChallengeMainScreen(),
        LoginScreen.routePath: (context) => const LoginScreen(),
        RegisterScreen.routePath: (context) => const RegisterScreen(),
        ArticleScreen.routePath: (context) => const ArticleScreen(),
        SearchProductScreen.routePath: (context) => const SearchProductScreen(),
        ProductReviewsScreen.routePath: (context) => const ProductReviewsScreen(),
        DetailArticleScreen.routePath: (context) => const DetailArticleScreen(),
        SaveArticleScreen.routePath: (context) => const SaveArticleScreen(),
        CartScreen.routePath: (context) => const CartScreen(),
        DetailOrderScreen.routePath: (context) => const DetailOrderScreen(),
        ProfileScreen.routePath: (context) => const ProfileScreen(),
        EditProfileScreen.routePath: (context) => const EditProfileScreen(),
        ProductScreen.routePath: (context) => const ProductScreen(),
        CheckoutScreen.routePath: (context) => const CheckoutScreen(),
        UseCouponScreen.routePath: (context) => const UseCouponScreen(),
        CheckoutAddressScreen.routePath: (context) => const CheckoutAddressScreen(),
        ChooseTransportScreen.routePath: (context) => const ChooseTransportScreen(),
        AddressListScreen.routePath: (context) => const AddressListScreen(),
        AddNewAddresScreen.routePath: (context) => const AddNewAddresScreen(),
        EditOldAddressScreen.routePath: (context) => const EditOldAddressScreen(),
        ManualTransferScreen.routePath: (context) => const ManualTransferScreen(),
        EWalletTransferScreen.routePath: (context) => const EWalletTransferScreen(),
        WhatsappTransferScreen.routePath: (context) => const WhatsappTransferScreen(),
        GopayScreen.routePath: (context) => const GopayScreen(),
        AddReviewScreen.routePath: (context) => const AddReviewScreen(),
        OrderListScreen.routePath: (context) => const OrderListScreen(),
        TelegramTransferScreen.routePath: (context) => const TelegramTransferScreen(),
        ChatbotScreen.routePath: (context) => const ChatbotScreen(),
        ChatBotEmptyScreen.routePath: (context) => const ChatBotEmptyScreen(),
        ChangePasswordScreen.routePath: (context) => const ChangePasswordScreen(),
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
