import 'package:flutter/material.dart';
import 'package:mer_group_app/Values/values.dart';

class RoundedBorderedWithIcon extends StatelessWidget {
  final IconData icon;
  final double? width;
  final double? height;

  const RoundedBorderedWithIcon({super.key, required this.icon, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 30,
      height: width ?? 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 3, color: HexColor.fromHex("31333d"))
      ),
      child: Center(child: Icon(icon, size: 20, color: Colors.white,),),
    );
  }

}