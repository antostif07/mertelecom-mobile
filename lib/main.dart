import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mer_group_app/Api/user_provider.dart';
import 'package:mer_group_app/Bindings/global_bindings.dart';
import 'package:mer_group_app/Controllers/authentication_manager.dart';
import 'package:mer_group_app/Middleware/global_middleware.dart';
import 'package:mer_group_app/Middleware/unauthenticated_middleware.dart';
import 'package:mer_group_app/Screens/Dashboard/timeline.dart';
import 'package:mer_group_app/Screens/Profile/profile_overview.dart';

import 'Bindings/sign_up_binding.dart';
import 'Constants/constants.dart';
import 'Screens/Auth/email_address.dart';
import 'Screens/Auth/login.dart';
import 'Screens/Auth/signup.dart';
import 'Screens/Onboarding/onboarding_carousel.dart';
import 'Screens/Onboarding/onboarding_start.dart';
import 'Screens/splash_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  final UserProvider userProvider = UserProvider();
  Get.lazyPut(() => AuthenticationManager(userProvider: userProvider));

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mer Group App',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      initialBinding: GlobalBindings(),
      getPages: [
        GetPage(
          name: '/', page: () => SplashScreen(),
          binding: GlobalBindings(),
          middlewares: [UnauthenticatedMiddleware()]
        ),
        GetPage(
            name: Routes.onBoardingStart,
            page: () => const OnboardingStart(),
            middlewares: [UnauthenticatedMiddleware()]
        ),
        GetPage(
            name: Routes.onBoardingCarousel,
            page: () => const OnboardingCarousel(),
            middlewares: [UnauthenticatedMiddleware()]
        ),
        GetPage(
            name: Routes.emailAddressRegistration, page: () => const EmailAddressScreen(),
            binding: SignUpBinding(), middlewares: [UnauthenticatedMiddleware()]
        ),
        GetPage(
            name: Routes.signUp, page: () => const SignUp(), binding: SignUpBinding(),
            middlewares: [UnauthenticatedMiddleware()]
        ),
        GetPage(
          name: Routes.login,
          page: () => const Login(),
          middlewares: [UnauthenticatedMiddleware()]
        ),
        GetPage(
            name: Routes.timeline, page: () => Timeline(),
            middlewares: [GlobalMiddleware()]
        ),
        GetPage(
          name: Routes.profileOverview, page: () => const ProfileOverview(), middlewares: [GlobalMiddleware()],
          binding: GlobalBindings(),
        )
      ],
      home: SplashScreen(),
    );
  }
}
