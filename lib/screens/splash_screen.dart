import 'dart:async';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:coredumpedapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed('/login'),
    );

    return Scaffold(
      body: AnimateGradient(
        duration: const Duration(seconds: 5),
        primaryColors: Constants.animateGradientPrimaryColors,
        secondaryColors: Constants.animateGradientSecondaryColors,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/white_core_dumped_logo.png',
                height: 128.0,
                width: 128.0,
              ),
              const SizedBox(height: 16.0),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
