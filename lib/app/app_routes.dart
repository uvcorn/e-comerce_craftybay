import 'package:crafty/features/auth/ui/screen/login_screen.dart';
import 'package:crafty/features/auth/ui/screen/verify_otp_screen.dart.dart';
import 'package:crafty/features/auth/ui/screen/reset_password_screen.dart';
import 'package:crafty/features/auth/ui/screen/sign_up_screen.dart';
import 'package:crafty/features/auth/ui/screen/splash_screen.dart';
import 'package:crafty/features/cart/ui/screens/cart_screen.dart';
import 'package:crafty/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty/features/product/ui/screens/product_details_screen.dart';
import 'package:crafty/features/product/ui/screens/product_list_screen.dart';
import 'package:crafty/features/review/ui/screen/review_screen_raw.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;

    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidget = LoginScreen();
    } else if (settings.name == SignUpScreen.name) {
      screenWidget = SignUpScreen();
    } else if (settings.name == VerifyOtpScreen.name) {
      final String email = settings.arguments as String;
      screenWidget = VerifyOtpScreen(email: email);
    } else if (settings.name == ResetPasswordScreen.name) {
      screenWidget = ResetPasswordScreen();
    } else if (settings.name == MainBottomNavScreen.name) {
      screenWidget = MainBottomNavScreen();
    } else if (settings.name == ProductListScreen.name) {
      final String category = settings.arguments as String;
      screenWidget = ProductListScreen(category: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      final String productId = settings.arguments as String;
      screenWidget = ProductDetailsScreen(productId: productId);
    } else if (settings.name == ReviewScreen.name) {
      screenWidget = ReviewScreen();
    } else if (settings.name == CartScreen.name) {
      screenWidget = CartScreen();
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
