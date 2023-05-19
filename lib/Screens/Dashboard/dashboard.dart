import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../BottomSheets/bottom_sheets.dart';
import '../../Values/values.dart';
import '../../widgets/BottomSheets/dashboard_settings_sheet.dart';
import '../../widgets/Buttons/primary_tab_buttons.dart';
import '../../widgets/Navigation/dasboard_header.dart';
import '../../widgets/Shapes/app_settings_icon.dart';
import '../Chat/chat_screen.dart';
import '../Profile/profile_overview.dart';
import 'DashboardTabScreens/overview.dart';
import 'DashboardTabScreens/productivity.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  // final ValueNotifier<bool> _totalTaskTrigger = ValueNotifier(true);
  // final ValueNotifier<bool> _totalDueTrigger = ValueNotifier(false);
  // final ValueNotifier<bool> _totalCompletedTrigger = ValueNotifier(true);
  // final ValueNotifier<bool> _workingOnTrigger = ValueNotifier(false);
  final ValueNotifier<int> _buttonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DashboardNav(
                icon: FontAwesomeIcons.comment,
                image: "assets/man-head.png",
                notificationCount: "2",
                page: const ChatScreen(),
                title: "Dashboard",
                onImageTapped: () {
                  Get.to(() => const ProfileOverview());
                },
              ),
              AppSpaces.verticalSpace20,
              Text("Hello,\nDereck Doyle 👋",
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              AppSpaces.verticalSpace20,
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //   //tab indicators
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       PrimaryTabButton(buttonText: "Overview", itemIndex: 0, notifier: _buttonTrigger),
              //       PrimaryTabButton(buttonText: "Productivity", itemIndex: 1, notifier: _buttonTrigger)
              //     ],
              //   ),
              //   Container(
              //       alignment: Alignment.centerRight,
              //       child: AppSettingsIcon(
              //         callback: () {
              //           showAppBottomSheet(
              //             DashboardSettingsBottomSheet(
              //               totalTaskNotifier: _totalTaskTrigger,
              //               totalDueNotifier: _totalDueTrigger,
              //               workingOnNotifier: _workingOnTrigger,
              //               totalCompletedNotifier: _totalCompletedTrigger,
              //             ),
              //           );
              //         },
              //       ))
              // ]),
              AppSpaces.verticalSpace20,
              ValueListenableBuilder(
                  valueListenable: _buttonTrigger,
                  builder: (BuildContext context, _, __) {
                    return _buttonTrigger.value == 0 ? const DashboardOverview() : const DashboardProductivity();
                  })
            ]),
          ),
        ));
  }
}
