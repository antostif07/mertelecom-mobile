import 'package:get/get.dart';
import 'package:mer_group_app/Model/user_model.dart';

import '../Model/token_model.dart';

class UserProvider extends GetConnect {
  Future<Response<UserModel>> registerUser(body) =>
      post<UserModel>(
        'http://localhost/mergroup_app_api/public/users', body,
        decoder: (obj) => UserModel.fromJson(obj)
      );

  Future<Response<TokenModel>> login(body) =>
      post<TokenModel>(
        'http://localhost/mergroup_app_api/public/login', body,
          decoder: (obj) => TokenModel.fromJson(obj)
      );
}