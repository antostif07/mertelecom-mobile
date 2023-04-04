// showSettingsBottomSheet() => showAppBottomSheet(ProjectDetailBottomSheet());

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mer_group_app/Values/values.dart';

showAppBottomSheet(
  Widget widget, {
    bool isScrollControlled = false,
    bool popAndShow = false, double? height
  }) {
  if(popAndShow) Get.back();
  return Get.bottomSheet(
    height == null ? widget : SizedBox(
      height: height, child: widget,
    ),
    backgroundColor: AppColors.primaryBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20)
      )
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isScrollControlled: isScrollControlled
  );
}