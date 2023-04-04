import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mer_group_app/Values/values.dart';
import 'package:mer_group_app/widgets/DarkBackground/dark_radial_background.dart';

import '../../widgets/Onboarding/slider_captioned-image.dart';
import '../Auth/email_address.dart';

class OnboardingCarousel extends StatefulWidget {
  const OnboardingCarousel({super.key});

  @override
  _OnboardingCarouselState createState() => _OnboardingCarouselState();

}

class _OnboardingCarouselState extends State<OnboardingCarousel>{
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? HexColor.fromHex("266ffe") : HexColor.fromHex("666a7a")
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            DarkRadialBackground(
              color: HexColor.fromHex("#181a1f"),
              position: "bottomRight",
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: Utils.screenHeight * 1.3,
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: const [
                        SliderCaptionedImage(
                            index: 0, imageUrl: "assets/slider-background-1.png", caption: "Task,\nCalendar,\nChat"
                        ),
                        SliderCaptionedImage(
                            index: 0, imageUrl: "assets/slider-background-3.png", caption: "Work\nAnywhere\nEasily"
                        ),
                        SliderCaptionedImage(
                            index: 0, imageUrl: "assets/slider-background-2.png", caption: "Manage\nEverything,\nOn Phone"
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: _buildPageIndicator(),
                          ),
                          const SizedBox(height: 50,),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const EmailAddressScreen());
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(HexColor.fromHex("246cfe")),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: HexColor.fromHex("246cfe"))
                                )),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.email, color: Colors.white,),
                                  Text('      Continue with Email', style: GoogleFonts.lato(fontSize: 20, color: Colors.white),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}