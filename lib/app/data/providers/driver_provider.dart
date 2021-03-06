import 'dart:convert';

import 'package:alfred_taxi_driver/app/data/models/driver_model.dart';
import 'package:alfred_taxi_driver/app/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DriverProvider extends GetConnect {
  Future<Driver> getDriver({
    required telephone,
    required password,
  }) async {
    var url = APPURL.BASE_URL +
        APPURL.GET_DRIVER_INFO +
        "password=$password&telephone=$telephone";

    var _res = Driver();

    final response = await http.get(Uri.parse(url));

    if (json.decode(response.body)["message"] == "succes") {
      print("***************SUCCES***************");
      _res = parseDriver(response.body);
    } else {
      print("***************ERREUR DE DONNEES***************");
      print(response.body);
      _res = Driver(id: 0);
    }

    return _res;
  }

  Future putDriverPosition({
    required vehicule_id,
    required latitude,
    required longitude,
  }) async {
    var url = APPURL.BASE_URL +
        APPURL.PUT_DRIVER_GPS +
        "vehicule_id=$vehicule_id&longitude=$longitude&latitude=$latitude";

    final response = await http.put(Uri.parse(url));
    print("${response.body}");
  }

  Driver parseDriver(responseBody) {
    final parsed =
        json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
    List<Driver> result =
        parsed.map<Driver>((json) => Driver.fromJson(json)).toList();
    if (result.isNotEmpty) {
      return result[0];
    } else {
      return Driver();
    }
  }
}
