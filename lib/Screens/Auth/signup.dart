import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/Utils/form_validator.dart';

import '../../Controllers/sign_up_controller.dart';
import '../../Values/values.dart';
import '../../widgets/DarkBackground/darkRadialBackground.dart';
import '../../widgets/Forms/form_input_with _label.dart';
import '../../widgets/Navigation/back.dart';

class SignUp extends GetView<SignUpController> with InputValidationMixin {
  const SignUp({super.key});

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
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const NavigationBack(),
                const SizedBox(height: 40),
                Text('Sign Up', style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                AppSpaces.verticalSpace20,
                Obx(() => RichText(
                  text: TextSpan(
                    text: 'Using  ',
                    style: GoogleFonts.lato(color: HexColor.fromHex("676979")),
                    children: <TextSpan>[
                      TextSpan(text: controller.email.value, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                      TextSpan(text: "  to login.", style: GoogleFonts.lato(color: HexColor.fromHex("676979"))),
                    ],
                  ),
                )),
                const SizedBox(height: 30),
                Obx(() => LabelledFormInput(
                  placeholder: "Name",
                  onChanged: (text) {
                    controller.name.value = text;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  label: "Your Name",
                  errorText: controller.errorNameText.value == '' ? null : controller.errorNameText.value,
                )),
                const SizedBox(height: 15),
                Obx(() => LabelledFormInput(
                  placeholder: "Password",
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    controller.password.value = text;
                  },
                  obscureText: controller.obscureText.value,
                  label: "Your Password",
                  errorText: controller.errorPasswordText.value == '' ? null : controller.errorPasswordText.value,
                  triggerObscureText: () {
                    controller.obscureText.value = !controller.obscureText.value;
                  },
                )),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if(!isLengthOk(controller.name.value, minLength: 3)){
                        controller.errorNameText.value = 'Name must have 3 characters';
                      } else if(!isPasswordValid(controller.password.value)) {
                        controller.errorPasswordText.value = 'Password must have 8 characters';
                      } else {
                        controller.register({
                          "email": controller.email.value,
                          "password": controller.password.value,
                          "name": controller.name.value
                        });
                      }
                    },
                    style: ButtonStyles.blueRounded,
                    child: Obx(
                        () => controller.isLoading.value ? const CircularProgressIndicator() : Text('Sign Up', style: GoogleFonts.lato(fontSize: 20, color: Colors.white))
                    ),
                  ),
                )
              ]))
      )
    ]));
  }
}
