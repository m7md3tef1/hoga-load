import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
import 'package:hoga_load/features/auth/login.dart';

import '../../core/data/local/cacheHelper.dart';
import '../../core/keys/keys.dart';
import '../home/view.dart';

class SplashScreen extends StatelessWidget {
  final Widget? nextScreen;

  const SplashScreen({Key? key, this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            duration: 2500,
            splashIconSize: 150,
            splash: Image.asset(AppImages.logo),
            nextScreen: CacheHelper.getString(SharedKeys.token) != null &&
                    CacheHelper.getString(SharedKeys.token)
                        .toString()
                        .isNotEmpty
                ? const Home()
                : Login(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.white));
  }
}
