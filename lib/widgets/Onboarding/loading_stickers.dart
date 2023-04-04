import 'package:flutter/material.dart';
import 'package:mer_group_app/Values/values.dart';
import 'package:mer_group_app/widgets/Onboarding/loading_bar.dart';

class LoadingSticker extends StatelessWidget {
  final List<Color> gradients;

  const LoadingSticker({super.key, required this.gradients});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.primaryBackgroundColor
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [...gradients]
              )
            ),
            child: const Icon(Icons.done),
          ),
          AppSpaces.horizontalSpace20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LoadingStickerBar(width: 70.0,),
              SizedBox(height: 5,),
              LoadingStickerBar(width: 30.0,)
            ],
          )
        ],
      ),
    );
  }

}