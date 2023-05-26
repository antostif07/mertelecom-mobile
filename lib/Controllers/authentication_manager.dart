import 'package:get/get.dart';
import 'package:mer_group_app/Api/user_provider.dart';
import 'package:mer_group_app/Constants/constants.dart';

import '../Utils/cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  AuthenticationManager({required this.userProvider});

  final UserProvider userProvider;
  final isLogged = false.obs;
  final isLoading = false.obs;
  final emailAddress = ''.obs;
  final password = ''.obs;
  final obscureText = true.obs;

  @override
  void onInit(){
    super.onInit();
    if(Get.arguments != null) {
      emailAddress.value = Get.arguments;
    }
  }

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  Future<void> login(body) async {
    try {
      isLoading(true);
      await userProvider.login(body).then((response) {
        if (response.statusCode == 200) {
          saveToken(response.body?.token);
          isLogged(true);
          Get.offAllNamed(Routes.timeline);
        } else {
          return null;
        }
      });
    } finally {
      isLoading(false);
    }
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    } else {
      isLogged.value = false;
    }
  }
}