// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Values/values.dart';

class LabelledFormInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? value;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function()? triggerObscureText;
  final void Function()? triggerRemoveText;
  final void Function(String)? onChanged;
  final String? errorText;

  const LabelledFormInput(
      {Key? key,
      required this.placeholder,
      required this.keyboardType,
      required this.obscureText,
      required this.label,
      this.value, this.validator, this.onChanged, this.errorText, this.triggerObscureText, this.triggerRemoveText})
      : super(key: key);

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
                //fontWeight: FontWeight.bold,
                color: HexColor.fromHex("3C3E49"))),
        TextFormField(
          validator: validator,
          initialValue: value,
          onChanged: onChanged,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          onTap: () {},
          keyboardType: keyboardType,
          //initialValue: initialValue,
          obscureText: obscureText,
          decoration: InputDecoration(
            errorText: errorText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              suffixIcon: placeholder == "Password"
                  ? InkWell(
                      onTap: () {
                        triggerObscureText!();
                      },
                      child: Icon(
                        !obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        //size: 15.0,
                        color: HexColor.fromHex("3C3E49"),
                      ))
                  : null,
              // InkWell(
              //         onTap: () {
              //           triggerRemoveText!();
              //         },
              //         child: Icon(FontAwesomeIcons.solidTimesCircle,
              //             size: 20, color: HexColor.fromHex("3C3E49")),
              //       ),
              hintText: placeholder,
              hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: HexColor.fromHex("3C3E49")),
              filled: false,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor.fromHex("3C3E49")),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")),
              ),
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
        ),
      ],
    );
  }
}
