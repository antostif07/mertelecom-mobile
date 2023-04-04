import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/Values/values.dart';

class LabelledFormInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? value;
  final String keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  const LabelledFormInput({super.key, required this.label, required this.placeholder, this.value, required this.keyboardType, required this.controller, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpaces.verticalSpace10,
        Text(label.toUpperCase(),
          textAlign: TextAlign.left,
          style: GoogleFonts.lato(
              fontSize: 12,
              color: HexColor.fromHex("3c3e49")
          ),
        ),
        TextFormField(
            controller: controller,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, fontSize: 18,
              color: Colors.white,
            ),
            onTap: () {},
            obscureText: placeholder == 'Password' || placeholder == 'Choose a password' ? true : false,
            keyboardType: keyboardType == "text" ? TextInputType.text : TextInputType.number,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 20
                ),
                hintText: placeholder,
                hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.bold, fontSize: 18,
                  color: HexColor.fromHex("3c3e49")
                ),
                filled: false,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor.fromHex("3c3e49"))
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor.fromHex("bef0b2"))
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
                ),
              // suffixIcon: placeholder == 'Password'
              //   ? InkWell(
              //   onTap: () {},
              //   child: Icon(
              //     obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
              //     color: HexColor.fromHex("3c3e49"),
              //   ) ,
              // ) : InkWell(
              //   onTap: () {
              //     controller.text = "";
              //   },
              //   child: Icon(FontAwesomeIcons.solidTimesCircle),
              // ),
            )
        ),
      ],
    );
  }

}