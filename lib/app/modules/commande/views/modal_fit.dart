import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:alfred_taxi_driver/app/constants/controllers.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:alfred_taxi_driver/app/themes/colors/app_colors.dart';
import 'package:alfred_taxi_driver/app/utils/images_path.dart';
import 'package:alfred_taxi_driver/app/utils/keywords.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text(
              "ECRIRE AU CLIENT",
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: const Icon(Icons.chat, color: AppColors.DGREEN),
            onTap: () async {
              ctlcommande.showEchangeDialogFunction(context);
            },
          ),
          ListTile(
            title: const Text(
              'APPELER CLIENT(E)',
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: Icon(Icons.call_outlined, color: AppColors.DBLUEDARK),
            onTap: () => launch(('tel://0757777500')),
          ),
          ListTile(
            title: const Text(
              'COMMENCER COURSE',
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: Icon(Icons.drive_eta, color: AppColors.DBLUE),
            onTap: () {
              ctlcommande.managerCourse(KEYWORD.COMMENCER);
            },
          ),
          ListTile(
            title: const Text(
              'TERMINER COURSE',
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: Icon(Icons.check, color: AppColors.DGREY1),
            onTap: () => ctlcommande.managerCourse(KEYWORD.TERMINER),
          ),
          ListTile(
            title: const Text(
              'ANNULER COURSE',
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: Icon(Icons.delete, color: AppColors.DRED),
            onTap: () => ctlcommande.managerCourse(KEYWORD.ANNULER),
          )
        ],
      ),
    ));
  }
}

class DrivingModalFit extends StatelessWidget {
  const DrivingModalFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text(
              "ECRIRE AU CLIENT",
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: const Icon(Icons.chat, color: AppColors.DGREEN),
            onTap: () async {
              ctlcommande.showEchangeDialogFunction(context);
            },
          ),
          ListTile(
            title: const Text(
              'APPELER CLIENT(E)',
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: Icon(Icons.call_outlined, color: AppColors.DBLUEDARK),
            onTap: () => launch(('tel://0757777500')),
          ),
          ListTile(
            title: const Text(
              'COMMENCER COURSE',
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: Icon(Icons.drive_eta, color: AppColors.DBLUE),
            onTap: () {
              ctlcommande.managerCourse(KEYWORD.COMMENCER);
            },
          ),
          ListTile(
            title: const Text(
              'TERMINER COURSE',
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: Icon(Icons.check, color: AppColors.DGREY1),
            onTap: () => ctlcommande.managerCourse(KEYWORD.TERMINER),
          ),
          ListTile(
            title: const Text(
              'ANNULER COURSE',
              style: TextStyle(
                  color: AppColors.DBLACK,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 6),
            ),
            leading: Icon(Icons.delete, color: AppColors.DRED),
            onTap: () => ctlcommande.managerCourse(KEYWORD.ANNULER),
          )
        ],
      ),
    ));
  }
}

class PayementModalFit extends StatelessWidget {
  const PayementModalFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            top: false,
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ListTile(
                      title: const Center(
                        child: Text(
                          "PAIEMENT COURSE",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            letterSpacing: 5,
                            color: AppColors.DBLACK,
                          ),
                        ),
                      ),
                      subtitle: ctlcommande.statuscommand.value ==
                              CMDSTATUS.COMMAND_TERMINEE
                          ? const Center(
                              child: Text("en attente de paiement",
                                  style: TextStyle(
                                    color: AppColors.DRED,
                                  )),
                            )
                          : const Center(
                              child: Text("paiement effectu??",
                                  style: TextStyle(
                                    color: AppColors.DGREEN,
                                  )),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    child: ListTile(
                      leading: Text("Montant \n?? prendre"),
                      title: Text(
                        "${MoneyFormatter(amount: double.parse(ctlcommande.commande.value.montantPercu.toString())).output.nonSymbol}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 42,
                            letterSpacing: 6,
                            color: AppColors.DRED),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ListTile(
                      leading: const Text("Montant \nr????l"),
                      title: Text(
                        MoneyFormatter(
                                amount: double.parse(ctlcommande
                                    .commande.value.montantReel
                                    .toString()))
                            .output
                            .nonSymbol,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          letterSpacing: 6,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ListTile(
                      leading: const Text("Montant \n?? reverser"),
                      title: Text(
                        MoneyFormatter(
                                amount: double.parse(ctlcommande
                                        .commande.value.montantPercu
                                        .toString()) -
                                    double.parse(ctlcommande
                                        .commande.value.montantReel
                                        .toString()))
                            .output
                            .nonSymbol,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          letterSpacing: 6,
                        ),
                      ),
                    ),
                  ),
                  // ctlcommande.statuscommand.value != CMDSTATUS.COMMAND_TERMINEE &&
                  //         ctlcommande.statuscommand.value !=
                  //            CMDSTATUS.COMMAND_PAIEMENT
                  //     ?
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      InkWell(
                        child: SizedBox(
                          width: 48.w,
                          height: 18.h,
                          child: Card(
                            elevation: 6,
                            child: GridTile(
                              child: Image.asset(
                                PathImage.cash,
                                fit: BoxFit.cover,
                              ),
                              footer: const GridTileBar(
                                backgroundColor: AppColors.DAMBER1,
                                title: Center(
                                  child: Text(
                                    "EN ESP??CE",
                                    style: TextStyle(
                                        color: AppColors.DBLACK,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 2,
                                        wordSpacing: 6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          var res = await showpaiementDialog(
                              context: context,
                              title: "Paiement en esp??ce",
                              message:
                                  "En acceptatnt de continuer vous valider que le client a pay?? la somme en esp??ce ?");
                          print(res);
                          if (res.toString().toLowerCase() == DIALOGRESULT.OK) {
                            await ctlcommande.procederAuPaiment();
                          }

                          //TODO
                        },
                      ),
                      InkWell(
                        child: SizedBox(
                          width: 48.w,
                          height: 18.h,
                          child: Card(
                            elevation: 6,
                            child: GridTile(
                              child: Image.asset(
                                PathImage.mobile,
                                fit: BoxFit.cover,
                              ),
                              footer: const GridTileBar(
                                backgroundColor: AppColors.DAMBER1,
                                title: Center(
                                  child: Text(
                                    "MOBILE MONEY",
                                    style: TextStyle(
                                        color: AppColors.DBLACK,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 2,
                                        wordSpacing: 6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          var res = await showpaiementDialog(
                              context: context,
                              title: "Paiement mobile money",
                              message:
                                  "En acceptatnt de continuer vous autoriser le client ?? effectuer le paiement par mobile money");

                          if (res.toString().toLowerCase() == DIALOGRESULT.OK) {
                            await ctlcommande.procederAuPaiment();
                          }
                          print(ctlcommande.statuscommand.value);
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      InkWell(
                        child: SizedBox(
                          width: 95.w,
                          height: 25.h,
                          child: Card(
                            elevation: 6,
                            child: GridTile(
                              child: Image.asset(
                                PathImage.bank,
                                fit: BoxFit.cover,
                              ),
                              footer: const GridTileBar(
                                backgroundColor: AppColors.DAMBER1,
                                title: Center(
                                  child: Text(
                                    "CARTE BANCAIRE",
                                    style: TextStyle(
                                        color: AppColors.DBLACK,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 2,
                                        wordSpacing: 6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          var res = await showpaiementDialog(
                              context: context,
                              title: "Paiement bancaire",
                              message:
                                  "En acceptatnt de continuer vous autoriser le client ?? effectuer un paiement bancaire?");

                          print(res);
                          if (res.toString().toLowerCase() == DIALOGRESULT.OK) {
                            await ctlcommande.procederAuPaiment();
                          }
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ctlcommande.statuscommand.value ==
                             CMDSTATUS.COMMAND_PAIEMENT
                          ? Card(
                              color: AppColors.DRED,
                              child: ListTile(
                                title: const Text(
                                  "MARQUER FIN DE LA COURSE",
                                  style: TextStyle(
                                      color: AppColors.DWHITE0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2,
                                      wordSpacing: 6),
                                ),
                                onTap: () async {
                                  var res = await showpaiementDialog(
                                      context: context,
                                      title: "FIN DE COURSE",
                                      message:
                                          "La course est termin??e, choisir un nouveau d??part ?");
                                  print(res);
                                  if (res.toString().toLowerCase() ==
                                      DIALOGRESULT.OK) {
                                    ctlcommande.managerCourse(KEYWORD.TERMINER,
                                        context: context);
                                  }
                                },
                              ),
                            )
                          : const SizedBox(),
                    ],
                  )
                  // : const SizedBox()
                  ,
                ],
              ),
            )));
  }

  Future<OkCancelResult> showpaiementDialog({
    required context,
    required title,
    required message,
  }) {
    return showOkCancelAlertDialog(
        context: context,
        cancelLabel: 'retour',
        okLabel: "confirmer",
        title: title,
        message: message);
  }

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
