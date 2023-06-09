import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mer_group_app/Api/user_provider.dart';

import '../Model/dashboard_model.dart';
import '../Screens/Dashboard/dashboard.dart';

class DashboardController extends GetxController with StateMixin<List<DashboardModel>> {
  final Da userProvider;

  DashboardController({required this.userProvider});

  final PageStorageBucket bucket = PageStorageBucket();
  final bottomNavigatorTrigger = 0.obs;
  StatelessWidget currentScreen = Dashboard();

  Future<void> getDashboardData() async {

  }
}