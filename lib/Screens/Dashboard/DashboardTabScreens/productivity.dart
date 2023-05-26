import 'package:flutter/material.dart';

import '../../../Values/values.dart';
import '../../../widgets/Dashboard/daily_goal_card.dart';
import '../../../widgets/Dashboard/productivity_chart.dart';

class DashboardProductivity extends StatelessWidget {
  const DashboardProductivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DailyGoalCard(),
        AppSpaces.verticalSpace20,
        const ProductivityChart()
      ],
    );
  }
}
