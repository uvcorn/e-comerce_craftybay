import 'package:crafty/features/auth/ui/screen/email_verification_screen.dart';
import 'package:crafty/features/auth/ui/screen/login_screen.dart';
import 'package:crafty/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:crafty/features/auth/ui/screen/reset_password_screen.dart';
import 'package:crafty/features/auth/ui/screen/sign_up_screen.dart';
import 'package:crafty/features/auth/ui/screen/splash_screen.dart';
import 'package:crafty/features/common/ui/screens/main_bottom_nav_screen.dart';
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
    } else if (settings.name == EmailVerificationScreen.name) {
      screenWidget = EmailVerificationScreen();
    } else if (settings.name == OtpVerificationScreen.name) {
      screenWidget = OtpVerificationScreen();
    } else if (settings.name == ResetPasswordScreen.name) {
      screenWidget = ResetPasswordScreen();
    } else if (settings.name == MainBottomNavScreen.name) {
      screenWidget = MainBottomNavScreen();
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
