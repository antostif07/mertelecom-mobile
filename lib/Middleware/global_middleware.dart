import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mer_group_app/Bindings/global_bindings.dart';
import 'package:mer_group_app/Constants/constants.dart';
import 'package:mer_group_app/Controllers/authentication_manager.dart';

class GlobalMiddleware extends GetMiddleware {
  final authenticationManager = Get.find<AuthenticationManager>();

  @override
  RouteSettings? redirect(String? route) {
    return authenticationManager.isLogged.value && !(route == Routes.login || route == Routes.signUp ||
        route == Routes.onBoardingCarousel || route == Routes.onBoardingStart || route == Routes.emailAddressRegistration)
        ? null : const RouteSettings(name: Routes.onBoardingStart);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return authenticationManager.getToken() != null
        ? page?.copy(parameters: {'token': authenticationManager.getToken().toString()}) : page;
  }

  @override
  List<Bindings> onBindingsStart(List<Bindings>? bindings) {
    bindings = [GlobalBindings()];
    return bindings;
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    if (kDebugMode) {
      print('Bindings of ${page.toString()} are ready');
    }
    return page;
  }

  @override
  Widget onPageBuilt(Widget page) {
    if (kDebugMode) {
      print('Widget ${page.toStringShort()} will be showed');
    }
    return page;
  }

  @override
  void onPageDispose() {
    if (kDebugMode) {
      print('Page disposed');
    }
  }
}