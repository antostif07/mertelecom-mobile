import 'package:get/get.dart';

import '../../remote_services.dart';
import 'site.dart';

class SiteController extends GetxController {
  var isLoading = true.obs;
  var siteList = <Site>[].obs;

  @override
  void onInit() {
    fetchSites();
    super.onInit();
  }

  void fetchSites() async {
    try {
      isLoading(true);
      var sites = await RemoteServices.fetchSites();

      if (sites != null) {
        siteList.value = sites;
      }
    } finally {
      isLoading(false);
    }
  }
}