import 'dart:convert';
import 'package:alfred_taxi_driver/app/data/models/message_support_model.dart';
import 'package:alfred_taxi_driver/app/data/models/objet_message_model.dart';
import 'package:alfred_taxi_driver/app/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MessageSupportProvider extends GetConnect {
  Future<MessageSupport> postMessageSupport(
      {required client_id, required objetc, required contenu}) async {
    var url = APPURL.BASE_URL +
        APPURL.MESSAGE_SUPPORT_URL +
        "objet=$objetc&contenu=$contenu&client_id=$client_id";

    var _res = MessageSupport();

    final response = await http.post(Uri.parse(url));
    print(response.body);
    _res = parseMessageSupport(response.body);

    return _res;
  }

  MessageSupport parseMessageSupport(responseBody) {
    final parsed = json.decode(responseBody);

    return MessageSupport.fromJson(parsed);
  }

  Future<List<ObjetMessage>> getObjetMessage() async {
    var url = APPURL.BASE_URL + APPURL.MESSAGE_OBJET_URL;

    var _res = <ObjetMessage>[];

    final response = await http.get(Uri.parse(url));
    print(response.body);
    _res = parseObjetMessages(response.body);

    return _res;
  }

  List<ObjetMessage> parseObjetMessages(responseBody) {
    final parsed =
        json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
    return parsed
        .map<ObjetMessage>((json) => ObjetMessage.fromJson(json))
        .toList();
  }
}
