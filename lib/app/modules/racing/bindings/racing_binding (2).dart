import 'package:get/get.dart';

import '../controllers/racing_controller.dart';

class RacingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RacingController>(
      () => RacingController(),
    );
  }
}
