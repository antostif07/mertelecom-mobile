import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Values/values.dart';
import '../widgets/AppLogo/app-logo.dart';
import '../widgets/DarkBackground/dark_radial_background.dart';
import 'Onboarding/onboarding_start.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Get.to(() => const OnboardingStart());
    });
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[HexColor.fromHex("#a7b2fd"), HexColor.fromHex("#c1a0fd")],
    begin: FractionalOffset.topCenter
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 30.0, 40.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft"
          ),
          const Positioned(child: AppLogo(), left: 140,),
          Center(
            child: Container(
              child: RichText(
                text: TextSpan(
                  text: 'mer',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'group',
                      style: TextStyle(
                          foreground: Paint()..shader = linearGradient,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0
                      )
                    )
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}