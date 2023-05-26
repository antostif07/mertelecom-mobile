import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/Controllers/sign_up_controller.dart';
import 'package:mer_group_app/Utils/form_validator.dart';

import '../../Values/values.dart';
import '../../widgets/DarkBackground/darkRadialBackground.dart';
import '../../widgets/Forms/form_input_with _label.dart';
import '../../widgets/Navigation/back.dart';
import '../../widgets/Shapes/background_hexagon.dart';

class EmailAddressScreen extends GetView<SignUpController> with InputValidationMixin {
  const EmailAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Positioned(
          top: Utils.screenHeight / 2,
          left: Utils.screenWidth,
          child: Transform.rotate(angle: -math.pi / 2, child: CustomPaint(painter: BackgroundHexagon()))),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const NavigationBack(),
          const SizedBox(height: 40),
          Text("What's your\nemail\naddress?",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          AppSpaces.verticalSpace20,
          Obx(
              () => LabelledFormInput(
                placeholder: "Email",
                onChanged: (text) {
                  controller.email.value = text;
                },
                triggerRemoveText: () {},
                value: controller.email.value,
                keyboardType: TextInputType.emailAddress,
                obscureText: !controller.obscureText.value,
                label: "Your Email",
                errorText: controller.errorText.value,
              )
          ),
          const SizedBox(height: 40),
          SizedBox(
            //width: 180,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  if (controller.email.value.isEmpty) {
                    Get.snackbar(
                        'Email Required', 'Enter your email to sign up',
                        colorText: Colors.white,
                        snackPosition: SnackPosition.TOP
                    );
                  } else if(!isEmailValid(controller.email.value)) {
                    controller.errorText.value = 'Email not valid';
                  } else {
                    Get.toNamed('/sign-up');
                  }
                },
                style: ButtonStyles.blueRounded,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email, color: Colors.white),
                    Text('   Continue with Email', style: GoogleFonts.lato(fontSize: 20, color: Colors.white)),
                  ],
                )),
          )
        ])),
      )
    ]));
  }
}
