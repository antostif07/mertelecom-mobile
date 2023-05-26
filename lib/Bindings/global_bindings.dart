import 'package:get/get.dart';
import 'package:mer_group_app/Api/user_provider.dart';
import 'package:mer_group_app/Controllers/authentication_manager.dart';

class GlobalBindings extends Bindings {
  final userProvider = UserProvider();

  @override
  void dependencies() {
    Get.put<UserProvider>(userProvider, permanent: true);
    Get.put<AuthenticationManager>(AuthenticationManager(userProvider: Get.find()), permanent: true);
  }
}