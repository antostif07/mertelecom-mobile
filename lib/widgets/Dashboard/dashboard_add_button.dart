import 'package:flutter/material.dart';
import 'package:mer_group_app/Values/values.dart';

class DashboardAddButton extends StatelessWidget {
  final VoidCallback? iconTapped;

  const DashboardAddButton({super.key, this.iconTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: iconTapped,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryAccentColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

}