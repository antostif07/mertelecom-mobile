import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mer_group_app/widgets/Shapes/roundedborder_with_icon.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: const RoundedBorderedWithIcon(
        icon: Icons.arrow_back,
      ),
    );
  }

}