import 'package:flutter/widgets.dart';
import 'package:mer_group_app/Values/values.dart';

class LoadingStickerBar extends StatelessWidget {
  final width;

  const LoadingStickerBar({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 5,
      decoration: BoxDecoration(
        color: HexColor.fromHex("5e6373"),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }

}