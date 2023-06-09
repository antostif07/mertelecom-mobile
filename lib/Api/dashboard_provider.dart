import 'package:get/get.dart';
import 'package:mer_group_app/Model/dashboard_model.dart';

class DashboardProvider extends GetConnect {
  Future<Response<DashboardModel>> getDashboard(token) =>
      get<DashboardModel>(
        'http://localhost/mergroup_app_api/public/dashboard',
          headers: {
            'Authorization': "Bearer $token"
          },
        decoder: (obj) => DashboardModel.fromJson(obj)
      );
}