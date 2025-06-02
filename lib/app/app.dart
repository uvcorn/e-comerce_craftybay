import 'package:crafty/features/auth/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'app_theme.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      // routes: {'/':(context)=> SplashScreen(),},
      theme: AppTheme.lightThemeData,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
