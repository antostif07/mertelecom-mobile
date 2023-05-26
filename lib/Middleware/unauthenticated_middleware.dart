import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mer_group_app/Bindings/global_bindings.dart';
import 'package:mer_group_app/Constants/constants.dart';
import 'package:mer_group_app/Controllers/authentication_manager.dart';

class UnauthenticatedMiddleware extends GetMiddleware {
  final authenticationManager = Get.find<AuthenticationManager>();

  @override
  RouteSettings? redirect(String? route) {
    print(authenticationManager.isLogged.value);
    return !authenticationManager.isLogged.value || route == Routes.login || route == Routes.signUp ||
        route == Routes.onBoardingCarousel || route == Routes.onBoardingStart || route == Routes.emailAddressRegistration
        ? null : const RouteSettings(name: Routes.timeline);
  }

  @override
  List<Bindings> onBindingsStart(List<Bindings>? bindings) {
    bindings = [GlobalBindings()];
    return bindings;
  }
}