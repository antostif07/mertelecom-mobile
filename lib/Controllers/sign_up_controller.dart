import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Api/user_provider.dart';
import '../Model/user_model.dart';

class SignUpController extends GetxController with StateMixin<List<UserModel>> {
  SignUpController({ required this.userProvider});

  final UserProvider userProvider;
  var isLoading = false.obs;
  RxString email = RxString('');
  RxString password = RxString('');
  RxString name = RxString('');
  RxnString errorText = RxnString(null);
  var errorNameText = ''.obs;
  var errorPasswordText = ''.obs;
  var obscureText = true.obs;

  @override
  void onInit() {
    super.onInit();

    if(Get.currentRoute == '/sign-up' && email.value == '') {
      Get.toNamed('/email-address-registration');
    }
  }

  Future<void> register(body) async {
    try {
      isLoading(true);
      await userProvider.registerUser(body).then((result) {
        if (kDebugMode) {
          print(result.body);
        }
        if (result.body != null) {
          final registeredEmail = result.body?.email;
          email.value = '';
          password.value = '';
          name.value = '';
          errorNameText.value = '';
          errorPasswordText.value = '';
          errorText.value = null;
          Get.offAllNamed('/login', arguments: registeredEmail);
        } else {
          Get.snackbar('Error', 'Error, verify your network');
        }
      });

    } finally {
      isLoading.value = false;
    }
  }
}