import 'package:flutter/material.dart';
import 'package:mer_group_app/Values/values.dart';

class BottomSheetHolder extends StatelessWidget {
  const BottomSheetHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: HexColor.fromHex("5e6272")
      ),
    );
  }

}