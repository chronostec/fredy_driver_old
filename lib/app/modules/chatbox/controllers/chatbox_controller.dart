import 'package:alfred_taxi_driver/app/constants/controllers.dart';
import 'package:alfred_taxi_driver/app/data/models/echange_model.dart';
import 'package:alfred_taxi_driver/app/data/providers/providers.dart';
import 'package:alfred_taxi_driver/app/data/services/stream_commande_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatboxController extends GetxController {
  RxBool DIALOGSTATUS = false.obs;
  RxBool UNREDMESSAGE = false.obs;

  var chatboxList = <Echange>[].obs;

  @override
  void onInit() {
    checkEchangePeriodicEvent();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<bool> ecrireMessage(String message) async {
    var _res = await proEchange.postEchange(
        cmde_id: ctlcommande.commande.value.id,
        driver_id: ctlHome.driver.value.id,
        message: message);
    lireMessages();
    return _res.bSuccess;
  }

  lireMessages() async {
    chatboxList.value =
        await proEchange.getEchange(cmde_id: ctlcommande.commande.value.id);
    chatboxList.value = chatboxList.reversed.toList();
    return chatboxList;
  }
}
