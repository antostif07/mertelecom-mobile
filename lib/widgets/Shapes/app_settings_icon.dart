import 'package:flutter/material.dart';

import 'settings_strip.dart';

class AppSettingsIcon extends StatelessWidget {
  final VoidCallback? callback;
  const AppSettingsIcon({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(children: const [
        SettingsStrip(),
        SizedBox(height: 2),
        RotatedBox(quarterTurns: 2, child: SettingsStrip())
      ]),
    );
  }
}
