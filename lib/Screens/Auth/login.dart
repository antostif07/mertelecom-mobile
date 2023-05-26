import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/Controllers/authentication_manager.dart';

import '../../Values/values.dart';
import '../../widgets/DarkBackground/darkRadialBackground.dart';
import '../../widgets/Forms/form_input_with _label.dart';
import '../../widgets/Navigation/back.dart';

class Login extends GetView<AuthenticationManager> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavigationBack(),
            const SizedBox(height: 40),
            Text('Login', style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
            AppSpaces.verticalSpace20,
            if (controller.emailAddress.value.isNotEmpty) RichText(
              text: TextSpan(
                text: 'Using  ',
                style: GoogleFonts.lato(color: HexColor.fromHex("676979")),
                children: <TextSpan>[
                  TextSpan(text: controller.emailAddress.value, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                  TextSpan(text: "  to login.", style: GoogleFonts.lato(color: HexColor.fromHex("676979"))),
                ],
              ),
            ),
            const SizedBox(height: 30),
            LabelledFormInput(
                placeholder: "Email",
                keyboardType: TextInputType.emailAddress,
                value: controller.emailAddress.value,
                onChanged: (text) {
                  controller.emailAddress.value = text;
                },
                label: "Email", obscureText: false,),
            const SizedBox(height: 30),
            Obx(() {
              return LabelledFormInput(
                  placeholder: "Password",
                  keyboardType: TextInputType.text,
                  obscureText: controller.obscureText.value,
                  triggerObscureText: () {
                    controller.obscureText.value = !controller.obscureText.value;
                  },
                  onChanged: (text) {
                    controller.password.value = text;
                  },
                  label: "Your Password");
            }),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    controller.login({
                      "email": controller.emailAddress.value,
                      "password": controller.password.value,
                    });
                  },
                  style: ButtonStyles.blueRounded,
                  child: Obx((){
                    return controller.isLoading.value ? const CircularProgressIndicator() : Text('Sign In', style: GoogleFonts.lato(fontSize: 20, color: Colors.white));
                  })
              ),
            )
          ],
        )),
      )
    ]));
  }
}
