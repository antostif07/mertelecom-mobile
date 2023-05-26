import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Values/values.dart';
import '../../widgets/Buttons/primary_progress_button.dart';
import '../../widgets/DarkBackground/darkRadialBackground.dart';
import '../../widgets/Forms/form_input_with _label.dart';
import '../../widgets/Navigation/app_header.dart';
import '../../widgets/dummy/profile_dummy.dart';
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String tabSpace = "\t\t\t";
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            AppHeader(
              title: "$tabSpace Edit Profile",
              widget: PrimaryProgressButton(
                width: 80,
                height: 40,
                label: "Done",
                textStyle: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                ProfileDummy(
                    color: HexColor.fromHex("94F0F1"),
                    dummyType: ProfileDummyType.Image,
                    scale: 3.0,
                    image: "assets/man-head.png"),
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: AppColors.primaryAccentColor.withOpacity(0.75),
                        shape: BoxShape.circle),
                    child: const Icon(FeatherIcons.camera,
                        color: Colors.white, size: 20))
              ],
            ),
            AppSpaces.verticalSpace20,
            const LabelledFormInput(
                placeholder: "Blake Gordon",
                keyboardType: TextInputType.text,
                obscureText: false,
                label: "Your Name"),
            AppSpaces.verticalSpace20,
            const LabelledFormInput(
                placeholder: "blake@gmail.com",
                keyboardType: TextInputType.text,
                obscureText: true,
                label: "Your Email"),
            AppSpaces.verticalSpace20,
            const LabelledFormInput(
                placeholder: "HikLHjD@&1?>",
                keyboardType: TextInputType.text,
                obscureText: true,
                label: "Your Password"),
            AppSpaces.verticalSpace20,
            const LabelledFormInput(
                placeholder: "Visual Designer",
                keyboardType: TextInputType.text,
                obscureText: true,
                label: "Role"),
            AppSpaces.verticalSpace20,
            const LabelledFormInput(
                placeholder: "Design & Cat Person",
                keyboardType: TextInputType.text,
                obscureText: true,
                label: "About Me"),
          ]))))
    ]));
  }
}
