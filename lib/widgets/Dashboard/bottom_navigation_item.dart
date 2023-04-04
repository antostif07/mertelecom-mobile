import 'dart:math';

import 'package:flutter/material.dart';



import '../../Values/values.dart';class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final int itemIndex;

  final ValueNotifier<int> notifier;
  const BottomNavigationItem({super.key, required this.icon, required this.itemIndex, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          notifier.value = itemIndex;
        },
        child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, _, __) {
            return Stack(
              children: [
                Positioned(
                  top: 13,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 30,
                        color: notifier.value != itemIndex ? Colors.grey : Colors.white,
                      ),
                      const SizedBox(height: 25,),
                      notifier.value != itemIndex
                          ? const SizedBox(width: 30, height: 30,)
                          : Transform.rotate(
                        angle: -pi / 4,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: HexColor.fromHex("c25fff")
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}