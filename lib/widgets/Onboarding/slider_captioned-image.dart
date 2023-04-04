import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/widgets/Shapes/background_hexagon.dart';

class SliderCaptionedImage extends StatelessWidget {
  final int index;
  final String caption;
  final String imageUrl;

  const SliderCaptionedImage({super.key, required this.index, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Image(
            image: AssetImage(imageUrl),
            fit: BoxFit.contain,
            height: 450,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(caption,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.white,
            )
          )
        ),
        index == 0 ? Positioned(
          bottom: 70, right: 50,
          child: Transform.scale(
            scale: 0.3,
            child: Transform.rotate(
              angle: -pi / 2,
              child: CustomPaint(painter: BackgroundHexagon(),),
            ),
          ),
        ) : const SizedBox()
      ],
    );
  }
}