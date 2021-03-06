import 'dart:convert';

import 'package:alfred_taxi_driver/app/data/models/partage_model.dart';
import 'package:alfred_taxi_driver/app/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/commande_model.dart';

class CommandeProvider extends GetConnect {
  Future<List<Commande>> getCommande({
    required driver_id,
  }) async {
    var url = APPURL.BASE_URL + APPURL.GET_LISTER_CMDE + "driver_id=$driver_id";

    var _list = <Commande>[];

    final response = await http.get(Uri.parse(url));
    print("LISTE COMMANDE ${response.body}");
    _list = parseCommandeDetails(response.body);

    return _list;
  }

  List<Commande> parseCommandes(responseBody) {
    final parsed =
        json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
    var res = parsed.map<Commande>((json) => Commande.fromJson(json)).toList();

    return res;
  }

  //////////////////////////////
  Future<List<Commande>> getCommandeDetail({
    required cmde_id,
  }) async {
    var url = APPURL.BASE_URL + APPURL.GET_DETAIL_CMDE + "cmde_id=$cmde_id";

    var _list = <Commande>[];

    final response = await http.get(Uri.parse(url));
    // print(response.body);
    _list = parseCommandes(response.body);

    if (_list.isNotEmpty) {
      return _list;
    } else {
      return [];
    }
  }

  Future<List<Commande>> getCommandeDetailAcceptee({
    required driver_id,
    required cmde_id,
  }) async {
    var url = APPURL.BASE_URL +
        APPURL.GET_DETAIL_CMDE_ACCEPTEE +
        "driver_id=$driver_id&cmde_id=$cmde_id";

    var _list = <Commande>[];

    final response = await http.get(Uri.parse(url));
    // print(response.body);
    _list = parseCommandes(response.body);

    if (_list.isNotEmpty) {
      return _list;
    } else {
      return [];
    }
  }

  Future<Resultat> putManagerCommande({
    required status,
    required driver_id,
    required cmde_id,
  }) async {
    var url = APPURL.BASE_URL +
        APPURL.PUT_MANAGER_CMDE +
        "driver_id=$driver_id&cmde_id=$cmde_id&status=$status";

    var _res = Resultat();
    final response = await http.put(Uri.parse(url));
    print(response.body);
    _res = parseResultats(response.body);

    return _res;
  }

  Resultat parseResultats(responseBody) {
    final parsed = json.decode(responseBody);

    return Resultat.fromJson(parsed);
  }

  List<Commande> parseCommandeDetails(responseBody) {
    final parsed =
        json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();

    return parsed.map<Commande>((json) => Commande.fromJson(json)).toList();
  }
}
