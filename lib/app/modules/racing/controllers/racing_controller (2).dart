import 'package:get/get.dart';

class RacingController extends GetxController {
  RxBool DIALOGSTATUS = false.obs;
  @override
  void onInit() {
    DIALOGSTATUS.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
