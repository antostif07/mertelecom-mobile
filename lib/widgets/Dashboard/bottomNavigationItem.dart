import 'package:flutter/material.dart';

import 'dart:math' as math;

import '../../Values/values.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final int itemIndex;
  final int notifier;
  final void Function()? onTap;

  const BottomNavigationItem({Key? key, required this.itemIndex, required this.icon, this.onTap, required this.notifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: Stack(children: [
          Positioned(
              top: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 30, color: notifier != itemIndex ? Colors.grey : Colors.white),
                  const SizedBox(height: 25),
                  notifier != itemIndex
                      ? const SizedBox(width: 30, height: 30)
                      : Transform.rotate(
                      angle: -math.pi / 4,
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), color: HexColor.fromHex("C25FFF"))))
                ],
              )),
        ]),
      ),
    );
  }
}
