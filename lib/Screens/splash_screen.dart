import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/Screens/Dashboard/timeline.dart';
import 'package:mer_group_app/Screens/Onboarding/onboarding_start.dart';

import '../Controllers/authentication_manager.dart';
import '../Values/values.dart';
import '../widgets/AppLogo/app_logo.dart';
import '../widgets/DarkBackground/darkRadialBackground.dart';

class SplashScreen extends GetView<AuthenticationManager> {
  SplashScreen({super.key});

  Future<void> initializeSettings() async {
    controller.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Get.offAllNamed('/onboarding-start');
  //   });
  // }

  final Shader linearGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    colors: <Color>[HexColor.fromHex("#a7b2fd"), HexColor.fromHex("#c1a0fd")],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 30.0, 40.0));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnBoard();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
        body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
      body: Stack(children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        const Positioned(left: 140, child: AppLogo()),
        Center(
            child: RichText(
              text: TextSpan(
                text: 'Mer',
                style: GoogleFonts.lato(fontSize: 40, color: Colors.white),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Telecom',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                ],
              ),
            ))
        // DarkRadialBackground(
        //   color: Colors.transparent,
        //   position: "bottomRight",
        // ),
      ]),
    );
  }
}

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ? const Timeline() : const OnboardingStart();
    });
  }
}
