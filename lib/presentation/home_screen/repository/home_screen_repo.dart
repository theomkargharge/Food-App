import 'dart:convert';

import 'package:task/data/api_client.dart';

class HomeScreenRepo {
 static ApiClient _apiClient = ApiClient();

 static Future<dynamic> getFoodData({body}) async {
    var endpoint = "http://canteen.benzyinfotech.com/api/v3/customer/report";

    try {
      var response = await _apiClient.postRequest(endpoint: endpoint, body: body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        // show error
      }
    } catch (e) {}
  }
}
