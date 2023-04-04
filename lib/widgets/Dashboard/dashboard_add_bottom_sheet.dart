import 'package:flutter/material.dart';
import 'package:mer_group_app/Values/values.dart';
import 'package:mer_group_app/widgets/Onboarding/labelled_option.dart';

import '../../BottomSheets/bottom_sheet.dart';
import '../BottomSheets/bottom_sheet_holder.dart';
import 'create_task.dart';

class DashboardAddBottomSheet extends StatelessWidget {
  const DashboardAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpaces.verticalSpace10,
        const BottomSheetHolder(),
        AppSpaces.verticalSpace10,
        LabelledOption(
          label: 'Create Task',
          icon: Icons.add_to_queue,
          callback: _createTask,
        ),
        LabelledOption(
          label: 'Create Project',
          icon: Icons.device_hub,
          callback: () {
            // Get.to(() => CreateProjectScreen())
          },
        ),
        LabelledOption(
          label: 'Create team',
          icon: Icons.people,
          callback: () {
            // Get.to(() => SelectMemberScreen())
          },
        ),
        LabelledOption(
          label: 'Create Event',
          icon: Icons.fiber_smart_record,
          callback: () {
            // Get.to(() => TaskDueDate())
          },
        ),
      ],
    );
  }

  void _createTask() {
    showAppBottomSheet(
        CreateTaskBottomSheet(),
        isScrollControlled: true,
        popAndShow: true
    );
  }
}