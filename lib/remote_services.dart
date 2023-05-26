import 'package:http/http.dart' as http;

import 'Model/site.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Site>?> fetchSites() async {
    var response = await client.get(Uri.parse('http://localhost/mergroup_app_api/public/sites'));

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return siteFromJson(jsonString);
    } else {
      return null;
    }
  }
}