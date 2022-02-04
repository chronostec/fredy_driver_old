import 'dart:async';

import 'package:alfred_taxi_driver/app/constants/controllers.dart';
import 'package:alfred_taxi_driver/app/utils/keywords.dart';

Future checkVehiculeAroundPeriodicEvent() async {
  if (ctlHome.driver.value.id != null && ctlHome.driver.value.id!.toInt() > 0) {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      if (ctlcommande.statuscommand.value != CMDSTATUS.COMMAND_EMPTY ||
          ctlcommande.statuscommand.value != CMDSTATUS.COMMAND_PAIEMENT ||
          ctlcommande.statuscommand.value != CMDSTATUS.COMMAND_PAIEMENT ||
          ctlcommande.statuscommand.value != CMDSTATUS.COMMAND_COMMENCEE) {
        ctlcommande.getCommandeDisponible();
      } else {
        timer.cancel();
      }
    });
  }
}

Future checkEchangePeriodicEvent() async {
  Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
    if (ctlcommande.statuscommand.value != CMDSTATUS.COMMAND_EMPTY ||
        ctlcommande.statuscommand.value != CMDSTATUS.COMMAND_PAIEMENT ||
        ctlcommande.statuscommand.value != CMDSTATUS.COMMAND_COMMENCEE) {
      ctlEchange.lireMessages();
    } else {
      timer.cancel();
    }
  });
}

// Future updateDriverPosition() async {
//   Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
//     print("GPS LAT ${ctlHome.driverGPS.value.latitude}");
//     print("GPS LNG${ctlHome.driverGPS.value.longitude}");
//     print("GPS ID${ctlHome.driver.value.vehiculeId}");
//     proDriver.putDriverPosition(
//         vehicule_id: ctlHome.driver.value.vehiculeId,
//         latitude: ctlHome.driverGPS.value.latitude,
//         longitude: ctlHome.driverGPS.value.longitude);
//   });
// }
