import 'package:alfred_taxi_driver/app/constants/controllers.dart';
import 'package:alfred_taxi_driver/app/data/models/commande_model.dart';
import 'package:alfred_taxi_driver/app/data/models/driver_model.dart';
import 'package:alfred_taxi_driver/app/data/services/local_storage.dart';
import 'package:alfred_taxi_driver/app/data/services/stream_commande_service.dart';
import 'package:alfred_taxi_driver/app/themes/colors/app_colors.dart';
import 'package:alfred_taxi_driver/app/utils/keywords.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  final defaultLanguage = 'fr_FR'.obs;
  final defaultTheme = 'LIGTH'.obs;
  final GlobalKey<ScaffoldState> ghomeKey = GlobalKey<ScaffoldState>();
  var driver = Driver().obs;
  RxBool DIALOGSTATUS = false.obs;

  RxDouble testZoom = 15.0.obs;

  @override
  void onInit() {
    readDriverLocalInfo();
    super.onInit();
  }

  @override
  void onReady() {
    ctlHome.rebaseCommandes();
    ctlcommande.getCommandeDisponible();
    // updateDriverPosition();
    // onMapCreated(mapController);
    super.onReady();
  }

  @override
  void onClose() {
    mapController.dispose();
  }

  /// READ DATA
  Future readDriverLocalInfo() async {
    driver.value = await LocalStorage().readUserData();
  }

  /// WRITE DATA
  Future writeDriverLocalInfo(Driver driver) async {
    await LocalStorage().saveUserData(driver);
    readDriverLocalInfo();
  }

  Future rebaseCommandes() async {
    ctlcommande.statuscommand.value = CMDSTATUS.COMMAND_EMPTY;
    ctlcommande.commande.value = Commande();
    checkVehiculeAroundPeriodicEvent();
  }

  var mapController;
  Location driverLocation = Location();
  var driverGPS = const LatLng(0.0, 0.0).obs;

  void onMapCreated(GoogleMapController _cntlr) {
    mapController = _cntlr;
    driverLocation.onLocationChanged.listen((l) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude!.toDouble(), l.longitude!.toDouble()),
              zoom: ctlcommande.statuscommand.value == CMDSTATUS.COMMAND_EMPTY
                  ? 15
                  : 16),
        ),
      );
      driverGPS.value = LatLng(l.latitude!.toDouble(), l.longitude!.toDouble());
      print(
          "DRIVER POSITION: ${l.latitude!.toDouble()} ${l.longitude!.toDouble()}");
      ctlDrivermap.refreshMarkers();

      if (ctlcommande.statuscommand.value == CMDSTATUS.COMMAND_ACCEPTEE) {
        ctlDrivermap.getPolyline(
          destination: LatLng(
            ctlcommande.commande.value.clientLatitude!.toDouble(),
            ctlcommande.commande.value.clientLongitude!.toDouble(),
          ),
          color: AppColors.DGREENLIGHT,
        );
      }
      if (ctlcommande.statuscommand.value == CMDSTATUS.COMMAND_COMMENCEE ||
          ctlcommande.statuscommand.value == CMDSTATUS.COMMAND_PAIEMENT) {
        ctlDrivermap.getPolyline(
          destination: LatLng(
            ctlcommande.commande.value.destLatitude!.toDouble(),
            ctlcommande.commande.value.destLongitude!.toDouble(),
          ),
          color: AppColors.DORANGE1,
        );
      }
    });
  }
}
