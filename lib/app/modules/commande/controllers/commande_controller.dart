import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:alfred_taxi_driver/app/constants/controllers.dart';
import 'package:alfred_taxi_driver/app/data/models/commande_model.dart';
import 'package:alfred_taxi_driver/app/data/providers/providers.dart';
import 'package:alfred_taxi_driver/app/data/services/stream_commande_service.dart';
import 'package:alfred_taxi_driver/app/modules/chatbox/views/chatbox_view.dart';
import 'package:alfred_taxi_driver/app/modules/commande/views/commande_driving_view.dart';
import 'package:alfred_taxi_driver/app/modules/commande/views/modal_fit.dart';
import 'package:alfred_taxi_driver/app/modules/profile/views/modals/modal_will_scope.dart';
import 'package:alfred_taxi_driver/app/routes/app_pages.dart';
import 'package:alfred_taxi_driver/app/themes/colors/app_colors.dart';
import 'package:alfred_taxi_driver/app/utils/keywords.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CommandeController extends GetxController {
  final commande = Commande(
    id: 1,
    duree: '22',
    distance: '34',
    montantPercu: "17500",
    montantReel: '13689',
    destLibelle: "Place Marcory",
    destLatitude: 5.400569670760325,
    destLongitude: -3.936553155757204,
    clientLibelle: "Sofitel Hotel Ivoire",
    clientLatitude: 5.374336050058717,
    clientLongitude: -3.963160667023872,
    clientId: 99,
    clientTelephone: "0757777500",
  ).obs;

  /////////////////////////////////////////////////////////////
  RxList<Commande> listCommande = <Commande>[
    // Commande(
    //   id: 1,
    //   duree: '22',
    //   distance: '34',
    //   montantPercu: "17500",
    //   montantReel: '13689',
    //   destLibelle: "Place Marcory",
    //   destLatitude: 5.400569670760325,
    //   destLongitude: -3.936553155757204,
    //   clientLibelle: "Sofitel Hotel Ivoire",
    //   clientLatitude: 5.374336050058717,
    //   clientLongitude: -3.963160667023872,
    //   clientId: 1002,
    //   clientTelephone: "0757777500",
    // ),
    // Commande(
    //   id: 2,
    //   duree: '7',
    //   distance: '3',
    //   montantPercu: "10500",
    //   montantReel: '9089',
    //   destLibelle: "SICTA Angré",
    //   destLatitude: 5.397492641273257,
    //   destLongitude: -3.962943347388611,
    //   clientLibelle: "Cité Diaspora",
    //   clientLatitude: 5.398261691870794,
    //   clientLongitude: -3.960014375382239,
    //   clientId: 2,
    //   clientTelephone: "0747777501",
    // ),
    // Commande(
    //   id: 3,
    //   duree: '15',
    //   distance: '9.5',
    //   montantPercu: "22500",
    //   montantReel: '18700',
    //   destLibelle: "Université Félix Houphouët-Boigny",
    //   destLatitude: 5.3473383140934185,
    //   destLongitude: -3.985999705493535,
    //   clientLibelle: "Boston Hill",
    //   clientLatitude: 5.391691545163144,
    //   clientLongitude: -3.958599273535927,
    //   clientId: 352,
    //   clientTelephone: "0707787500",
    // ),
    // Commande(
    //   id: 4,
    //   duree: '6',
    //   distance: '34',
    //   montantPercu: "17500",
    //   montantReel: '13689',
    //   destLibelle: "Place Marcory",
    //   destLatitude: 5.397300378471484,
    //   destLongitude: -3.954188617875062,
    //   clientLibelle: "Pharmacie les ARUMS",
    //   clientLatitude: 5.401594233186476,
    //   clientLongitude: -3.95370582029159,
    //   clientId: 92,
    //   clientTelephone: "0757677500",
    // ),
    // Commande(
    //   id: 5,
    //   duree: '13',
    //   distance: '34',
    //   montantPercu: "19500",
    //   montantReel: '13689',
    //   destLibelle: "Soleil 3",
    //   destLatitude: 5.390838177247085,
    //   destLongitude: -3.978253052844907,
    //   clientLibelle: "Clinique médicale",
    //   clientLatitude: 5.399383222853933,
    //   clientLongitude: -3.9660221807303917,
    //   clientId: 92,
    //   clientTelephone: "0757677500",
    // ),
  ].obs;

  RxInt statuscommand = 1000.obs;
  RxBool isGetting = false.obs;
  RxBool isPosting = false.obs;
  RxBool isRequesting = false.obs;

  var mapStyle = "".obs;
  RxBool DIALOGSTATUS = false.obs;

  @override
  void onInit() {
    DIALOGSTATUS.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    checkVehiculeAroundPeriodicEvent();
    super.onReady();
  }

  @override
  void onClose() {}

  ///`LISTE COMMANDES`
  Future getCommandeDisponible() async {
    listCommande.value =
        await proCommande.getCommande(driver_id: ctlHome.driver.value.id);
  }

  ///`DETAIL COMMAND`
  Future<bool> getDetailCommande() async {
    bool _isOk = false;
    var _resultat =
        await proCommande.getCommandeDetail(cmde_id: commande.value.id);

    if (_resultat.isNotEmpty && _resultat[0].status != 2) {
      commande.value = _resultat[0];
      _isOk = true;
    } else {
      commande.value = Commande();
      _isOk = false;
    }
    // await ctlDrivermap.getAddressFromLatLong(LatLng(
    //     commande.value.clientLatitude ?? 0,
    //     commande.value.clientLongitude ?? 0));
    return _isOk;
  }

  ///`DETAIL COMMAND`
  Future<bool> getDetailCommandeAcceptee() async {
    bool _isOk = false;
    var _resultat = await proCommande.getCommandeDetailAcceptee(
        cmde_id: commande.value.id, driver_id: ctlHome.driver.value.id);

    if (_resultat.isNotEmpty) {
      commande.value = _resultat[0];
      _isOk = true;
    } else {
      commande.value = Commande();
      _isOk = false;
    }

    return _isOk;
  }

  changeStatus(int value) => statuscommand.value = value;

  Future<dynamic> showEchangeDialogFunction(BuildContext context) {
    return showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ChatboxView(),
    );
  }

  ///`MANAGER LA COURSE EN CHANGEANT LE STATUS 0,1,2,3...`
  Future managerCourse(String action, {context}) async {
    await executerAction(action, context: context);
  }

  Future executerAction(String action, {context}) async {
    switch (action.toLowerCase()) {
      case KEYWORD.APPELER:
        launch('tel://${ctlcommande.commande.value.clientTelephone}');
        break;
      case KEYWORD.ECHANGER:
        ctlcommande.showEchangeDialogFunction(context);
        break;
      case KEYWORD.ACCEPTER:
        showEndedCoursetDialog(context: context);
        accepterCourse();
        break;
      case KEYWORD.ANNULER:
        showEndedCoursetDialog(context: context);
        annulerCourse();
        break;
      case KEYWORD.COMMENCER:
        showEndedCoursetDialog(context: context);
        commencerCourse();

        break;
      case KEYWORD.TERMINER:
        // showEndedCoursetDialog(context: context);
        terminerCourse();
        break;
      case KEYWORD.PAYER:
        statuscommand.value = CMDSTATUS.COMMAND_PAIEMENT;

        break;
      default:
    }
  }

  /// ACCEPTER COMMANDE
  accepterCourse() async {
    await postManagerCmde(
            driver_id: ctlHome.driver.value.id as int,
            cmde_id: commande.value.id as int,
            status: CMDSTATUS.COMMAND_ACCEPTEE)
        .then((value) {
      if (value) {
        statuscommand.value = CMDSTATUS.COMMAND_ACCEPTEE;
        Get.off(() => CommandeDrivingView());
      } else {
        Get.snackbar("ACCEPTATION COMMANDE",
            "Quelque chose de s'est mal passé, veuillez recommencer svp !");
      }
    });
  }

  /// COMMENCER COURSE
  commencerCourse() async {
    await postManagerCmde(
            driver_id: ctlHome.driver.value.id as int,
            cmde_id: commande.value.id!.toInt(),
            status: CMDSTATUS.COMMAND_COMMENCEE)
        .then((value) {
      if (value) {
        statuscommand.value = CMDSTATUS.COMMAND_COMMENCEE;
        Get.back();
      } else {
        Get.snackbar("COMMENCER COURSE",
            "Quelque chose de s'est mal passé, veuillez recommencer svp !");
      }
    });
  }

  /// ANNULER COURSE
  annulerCourse() async {
    await postManagerCmde(
            driver_id: ctlHome.driver.value.id as int,
            cmde_id: commande.value.id!.toInt(),
            status: CMDSTATUS.COMMAND_ANNULEE)
        .then((value) {
      if (value) {
        ctlHome.rebaseCommandes().then((value) => Get.offAllNamed(Routes.HOME));
      } else {
        Get.snackbar("ANNULER COURSE",
            "Quelque chose de s'est mal passé, veuillez recommencer svp !");
      }
    });
  }

  /// TERMINER COURSE
  terminerCourse() async {
    await postManagerCmde(
            driver_id: ctlHome.driver.value.id as int,
            cmde_id: commande.value.id!.toInt(),
            status: CMDSTATUS.COMMAND_TERMINEE)
        .then((value) {
      if (value) {
        // ctlHome.rebaseCommandes();
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("TERMINER COURSE",
            "Quelque chose de s'est mal passé, veuillez recommencer svp !");
      }
    });
  }

  Future procederAuPaiment() async {
    print("PAIEMENT");
    statuscommand.value = CMDSTATUS.COMMAND_PAIEMENT;
  }

  Future<bool> postManagerCmde(
      {required int driver_id, required int cmde_id, required status}) async {
    var res = await proCommande.putManagerCommande(
        status: status, cmde_id: cmde_id, driver_id: driver_id);
    return res.bSuccess;
  }

  /// SHOW AWAIT DIALOG
  showEndedCoursetDialog({
    required context,
  }) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 25.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "Patientez svp",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  letterSpacing: 4,
                ),
              ),
              Center(
                child: SpinKitDualRing(
                  color: AppColors.DRED1,
                  lineWidth: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
