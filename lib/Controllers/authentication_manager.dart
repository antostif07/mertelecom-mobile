import 'package:get/get.dart';
import 'package:mer_group_app/Api/user_provider.dart';
import 'package:mer_group_app/Constants/constants.dart';

import '../Utils/cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  AuthenticationManager({required this.userProvider});

  final UserProvider userProvider;
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

  Future<void> logOut() async {
    isLoading(true);
    await setIsLogged(false);
    await removeToken();
    await removeConnectedUser();
    isLoading(false);
    Get.toNamed(Routes.onBoardingStart);
  }

  Future<void> login(body) async {
    try {
      isLoading(true);
      await userProvider.login(body).then((response) {
        if (response.statusCode == 200) {
          try {
            userProvider.getCurrentUser(response.body?.token).then((value) {
              if (response.statusCode == 200) {
                saveToken(response.body?.token);
                saveConnectedUser(value.body);
                setIsLogged(true);
                Get.offAllNamed(Routes.timeline);
              }
            });
          } finally {

          }

        } else {
          return null;
        }
      });
    } finally {
      isLoading(false);
    }
  }

  Future<void> checkLoginStatus() async {
    final token = getToken();
    if (token != null) {
      await setIsLogged(true);
    } else {
      await setIsLogged(false);
    }
  }
}