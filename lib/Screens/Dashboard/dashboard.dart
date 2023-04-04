import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/Values/values.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DashboardNav(
              //   icon: FontAwesomeIcons.comment,
              //   image: "assets/man-head.png",
              //   notificationCount: "2",
              //   page: ChatScreen(),
              //   title: "Dashboard",
              //   onImageTapped: () {
              //     Get.to(() => ProfileOverview());
              //   }
              // ),
              AppSpaces.verticalSpace20,
              Text("Hello, \nAntonio Stifler",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
              AppSpaces.verticalSpace20

            ],
          ),
        ),
      ),
    );
  }

}