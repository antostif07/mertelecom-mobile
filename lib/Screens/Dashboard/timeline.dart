import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:mer_group_app/Controllers/dashboard_controller.dart';

import '../../BottomSheets/bottom_sheets.dart';
import '../../Constants/constants.dart';
import '../../Values/values.dart';
import '../../widgets/DarkBackground/darkRadialBackground.dart';
import '../../widgets/Dashboard/bottomNavigationItem.dart';
import '../../widgets/Dashboard/dashboard_add_icon.dart';
import '../../widgets/Dashboard/dashboard_add_sheet.dart';

class Timeline extends GetView<DashboardController> {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor.fromHex("#181a1f"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Obx(() => PageStorage(
              bucket: controller.bucket,
              child: dashBoardScreens[controller.bottomNavigatorTrigger.value]))
        ]),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 80,
            padding: const EdgeInsets.only(top: 5, right: 30, left: 30),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: HexColor.fromHex("#181a1f").withOpacity(0.8)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => BottomNavigationItem(
                      itemIndex: 0,
                      onTap: () {
                        controller.bottomNavigatorTrigger.value = 0;
                      },
                      notifier: controller.bottomNavigatorTrigger.value,
                      icon: Icons.widgets)),
                  const Spacer(),
                  Obx(() => BottomNavigationItem(
                      itemIndex: 1,
                      onTap: () {
                        controller.bottomNavigatorTrigger.value = 1;
                      },
                      notifier: controller.bottomNavigatorTrigger.value,
                      icon: FeatherIcons.clipboard),),
                  const Spacer(),
                  DashboardAddButton(
                    iconTapped: (() {
                      showAppBottomSheet(SizedBox(
                          height: Utils.screenHeight * 0.9,
                          child: const DashboardAddBottomSheet()));
                    }),
                  ),
                  const Spacer(),
                  Obx(() => BottomNavigationItem(
                      itemIndex: 2,
                      onTap: () {
                        controller.bottomNavigatorTrigger.value = 2;
                      },
                      notifier: controller.bottomNavigatorTrigger.value,
                      icon: FeatherIcons.bell)),
                  const Spacer(),
                  Obx(() => BottomNavigationItem(
                      itemIndex: 3,
                      onTap: () {
                        controller.bottomNavigatorTrigger.value = 3;
                      },
                      notifier: controller.bottomNavigatorTrigger.value,
                      icon: FeatherIcons.search))
                ])));
  }
}
