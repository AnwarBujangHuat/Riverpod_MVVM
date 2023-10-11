// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:mobile_flutter_template/app/app_prefs.dart';
import 'package:mobile_flutter_template/presentation/resources/assets_manager.dart';
import 'package:mobile_flutter_template/presentation/resources/color_manager.dart';
import 'package:mobile_flutter_template/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
    // _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
    //       if (isUserLoggedIn)
    //         {Navigator.pushReplacementNamed(context, Routes.mainRoute)}
    //       else
    //         {
    //           _appPreferences
    //               .isOnBoardingScreenViewed()
    //               .then((isOnBoardingScreenViewed) => {
    //                     if (isOnBoardingScreenViewed)
    //                       {
    //                         Navigator.pushReplacementNamed(
    //                             context, Routes.loginRoute)
    //                       }
    //                   })
    //         }
    //     });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
