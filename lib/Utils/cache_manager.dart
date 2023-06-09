import 'package:get_storage/get_storage.dart';
import 'package:mer_group_app/Model/user_model.dart';

mixin CacheManager {
  Future<bool> saveConnectedUser(UserModel? user) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.connectedUser.toString(), user);
    return true;
  }

  UserModel getConnectedUser() {
    final box = GetStorage();
    final connectedUser = box.read(CacheManagerKey.connectedUser.toString());
    if (connectedUser.runtimeType is! UserModel) {
      return UserModel.fromJson(connectedUser);
    }
    return connectedUser;
  }

  Future<void> removeConnectedUser() {
    final box = GetStorage();
    return box.remove(CacheManagerKey.connectedUser.toString());
  }

  Future<bool> setIsLogged(bool isLogged) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.isLogged.toString(), isLogged);
    return true;
  }

  bool isLogged() {
    final box = GetStorage();
    return box.read(CacheManagerKey.isLogged.toString());
  }
  // Save Token
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() {
    final box = GetStorage();
    return box.remove(CacheManagerKey.token.toString());
  }
}

enum CacheManagerKey {
  token, connectedUser, isLogged,
}