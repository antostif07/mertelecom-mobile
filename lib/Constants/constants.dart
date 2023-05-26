import 'package:flutter/material.dart';

import '../Data/data_model.dart';
import '../Screens/Dashboard/dashboard.dart';
import '../Screens/Dashboard/notifications.dart';
import '../Screens/Dashboard/projects.dart';
import '../Screens/Dashboard/search_screen.dart';
import '../Values/values.dart';
import '../widgets/Chat/online_user.dart';

String tabSpace = "\t\t\t";

final List<Widget> dashBoardScreens = [
  Dashboard(),
  const ProjectScreen(),
  const NotificationScreen(),
  SearchScreen()
];

List<Color> progressCardGradientList = [
  //green
  HexColor.fromHex("87EFB5"),
  //blue
  HexColor.fromHex("8ABFFC"),
  //pink
  HexColor.fromHex("EEB2E8"),
];

final onlineUsers = List.generate(
    AppData.onlineUsers.length,
    (index) => OnlineUser(
          image: AppData.onlineUsers[index]['profileImage'],
          imageBackground: AppData.onlineUsers[index]['color'],
          userName: AppData.onlineUsers[index]['name'],
        ));

class Routes {
  Routes._();

  // Unauthenticated Routes
  static const String onBoardingStart = '/onboarding-start';
  static const String onBoardingCarousel = '/onboarding-carousel';
  static const String emailAddressRegistration = '/email-address-registration';
  static const String signUp = '/sign-up';
  static const String login = '/login';

  // Authenticated Routes
  static const String timeline = '/timeline';
}