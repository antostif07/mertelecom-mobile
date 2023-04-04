import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/widgets/Onboarding/loading_stickers.dart';

import '../../Values/values.dart';
import '../../widgets/DarkBackground/dark_radial_background.dart';
import '../../widgets/Onboarding/background_image.dart';
import '../../widgets/Onboarding/bubble.dart';
import '../../widgets/Shapes/background_hexagon.dart';
import 'onboarding_carousel.dart';

class OnboardingStart extends StatelessWidget {
  const OnboardingStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Positioned(
            top: Utils.screenHeight, left: 0,
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: CustomPaint(
                painter: BackgroundHexagon(),
              ),
            ),
          ),
          // images
          Positioned(
            top: Utils.screenHeight * 0.7, right: 100,
            child: BackgroundImage(
              scale: 1.0,
              image: "assets/man-head.png",
              gradient: [HexColor.fromHex("92ecec"), HexColor.fromHex("92ecec")],
            ),
          ),
          Positioned(
            top: Utils.screenHeight * 0.50, left: Utils.screenWidth * 0.12,
            child: BackgroundImage(
              scale: 0.5,
              image: "assets/head_cut.png",
              gradient: [HexColor.fromHex("fd9871"), HexColor.fromHex("f7d092")],
            ),
          ),
          Positioned(
            top: Utils.screenHeight * 0.30, right: 70,
            child: BackgroundImage(
              scale: 0.4,
              image: "assets/girl_smile.png",
              gradient: [HexColor.fromHex("a7b2fd"), HexColor.fromHex("c1a0fd")],
            ),
          ),
          // end of images
          
          // Bubble
          Positioned(
            top: 80, left: 50,
            child: Bubble(scale: 1.0, color: HexColor.fromHex("a06af9"),),
          ),
          Positioned(
            top: 130, left: 130,
            child: Bubble(scale: 0.6, color: HexColor.fromHex("fda5ff"),),
          ),
          // end of bubbles

          Positioned(
            top: Utils.screenHeight * 0.12,
            left: Utils.screenWidth * 0.45,
            child: LoadingSticker(gradients: [HexColor.fromHex("f3eeae"), HexColor.fromHex("f3efab"), HexColor.fromHex("4a88fe")],),
          ),
          Positioned(
            top: Utils.screenHeight * 0.50,
            left: Utils.screenWidth * 0.22,
            child: LoadingSticker(gradients: [HexColor.fromHex("a7b2fd"), HexColor.fromHex("c1a0fd"),],),
          ),
          Positioned(
            top: Utils.screenHeight * 0.7,
            left: Utils.screenWidth * 0.6,
            child: LoadingSticker(gradients: [HexColor.fromHex("a7b2fd"), HexColor.fromHex("c1a0fd"),],),
          ),
          Positioned(
            top: Utils.screenHeight * 1.3,
            left: Utils.screenWidth * 0.83,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: InkWell(
                onTap: () {
                  Get.to(() => const OnboardingCarousel());
                },
                child: Container(
                  width: 200, height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: HexColor.fromHex("b6ffe5"),
                  ),
                  child: Transform.rotate(
                    angle: math.pi / 4,
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 80, left: 30),
                      child: const Icon(Icons.arrow_forward, size: 40,),
                    ),
                  ),
                ),
              ),
            )
          ),
          Positioned(
            bottom: 150,
            left: 40,
            child: SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Task Management',
                      style: GoogleFonts.lato(fontSize: 18, color: HexColor.fromHex("fda5ff")),
                      children: const [
                        TextSpan(
                          text: "🙌"
                        )
                      ]
                    ),
                  ),
                  Text('Lets create\na space\nfor your workflows,',
                    style: GoogleFonts.lato(
                        color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold
                    ),
                  ),
                  AppSpaces.verticalSpace20,
                  SizedBox(
                    width: 180,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const OnboardingCarousel());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(HexColor.fromHex("246cfe")),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: HexColor.fromHex("246cfe"))
                            )
                        )
                      ),
                      child: Center(
                        child: Text('Get Started', style: GoogleFonts.lato(fontSize: 20, color: Colors.white),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}