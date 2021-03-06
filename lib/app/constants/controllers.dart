import 'package:alfred_taxi_driver/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:alfred_taxi_driver/app/modules/chatbox/controllers/chatbox_controller.dart';
import 'package:alfred_taxi_driver/app/modules/commande/controllers/commande_controller.dart';
import 'package:alfred_taxi_driver/app/modules/driver_map/controllers/driver_map_controller.dart';
import 'package:alfred_taxi_driver/app/modules/history/controllers/history_controller.dart';
import 'package:alfred_taxi_driver/app/modules/home/controllers/home_controller.dart';
import 'package:alfred_taxi_driver/app/modules/notifications/controllers/notifications_controller.dart';
import 'package:alfred_taxi_driver/app/modules/parametres/controllers/parametres_controller.dart';
import 'package:alfred_taxi_driver/app/modules/payment/controllers/payment_controller.dart';
import 'package:alfred_taxi_driver/app/modules/profile/controllers/profile_controller.dart';
import 'package:alfred_taxi_driver/app/modules/racing/controllers/racing_controller.dart';
import 'package:alfred_taxi_driver/app/modules/recovery/controllers/recovery_controller.dart';
import 'package:alfred_taxi_driver/app/modules/support/controllers/support_controller.dart';
import 'package:get/get.dart';

HomeController ctlHome = Get.put(HomeController());
AuthenticationController ctlAuth = Get.put(AuthenticationController());
ChatboxController ctlEchange = Get.put(ChatboxController());
CommandeController ctlcommande = Get.put(CommandeController());
HistoryController ctlHistory = Get.put(HistoryController());
PaymentController ctlPaiement = Get.put(PaymentController());
RacingController ctlRacing = Get.put(RacingController());
RecoveryController ctlRecovery = Get.put(RecoveryController());
SupportController ctlSupport = Get.put(SupportController());
ProfileController ctlProfile = Get.put(ProfileController());
DriverMapController ctlDrivermap = Get.put(DriverMapController());
ParametresController ctlParametre = Get.put(ParametresController());
NotificationsController ctlNotifications = Get.put(NotificationsController());
