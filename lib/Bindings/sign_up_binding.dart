import 'package:get/get.dart';
import 'package:mer_group_app/Api/user_provider.dart';
import 'package:mer_group_app/Controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProvider());
    Get.put(SignUpController(userProvider: Get.find()));
  }

}