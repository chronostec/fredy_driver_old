import 'package:alfred_taxi_driver/app/constants/controllers.dart';
import 'package:alfred_taxi_driver/app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

AppBar CommandeAppBarView() {
  return AppBar(
    // leading: IconButton(
    //     onPressed: () {
    //       ctlHome.mapController.dispose();
    //       Get.back();
    //     },
    //     icon: Icon(Icons.arrow_back)),
    title: Text(
      "De ${ctlDrivermap.distanceDuree.value.libelle ?? ''}",
      overflow: TextOverflow.clip,
      maxLines: 1,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    bottom: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            width: 80.w,
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.spaceAround,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      "à",
                      style: TextStyle(color: AppColors.DWHITE0),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "${ctlcommande.commande.value.destLibelle ?? ''}"
                          .split(',')
                          .first
                          .toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: AppColors.DWHITE0),
                    ),
                  ],
                ),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "MT: ",
                          style: TextStyle(color: AppColors.DWHITE0),
                        ),
                        Text(
                          "${ctlcommande.commande.value.montantPercu ?? ''} F",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: AppColors.DWHITE0),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text(
                          "Durée: ",
                          style: TextStyle(color: AppColors.DWHITE0),
                        ),
                        Text(
                          "${ctlcommande.commande.value.duree ?? ''} min",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: AppColors.DWHITE0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(55.0)),
  );
}

AppBar DrivingAppBarView() {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          // ctlHome.mapController.dispose();
          // Get.back();
        },
        icon: const Icon(Icons.directions, color: AppColors.DWHITE0)),
    title: /*  ctlcommande.statuscommand.value == STATUS.COMMAND_ENDED
        ? const Text(
            'Bonne arrivée !',
            overflow: TextOverflow.clip,
            maxLines: 1,
          )
        : */
        Text(
      "De ${ctlDrivermap.distanceDuree.value.libelle ?? ''}",
      overflow: TextOverflow.clip,
      maxLines: 1,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    bottom: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            width: 95.w,
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.spaceAround,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text("à", style: TextStyle(color: AppColors.DWHITE0)),
                    const SizedBox(width: 20),
                    Text(
                      "${ctlcommande.commande.value.destLibelle ?? ''}"
                          .split(',')
                          .first
                          .toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: AppColors.DWHITE0),
                    ),
                  ],
                ),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text("MT RÉEL: ",
                            style: TextStyle(color: AppColors.DWHITE0)),
                        Text(
                          "${ctlcommande.commande.value.montantPercu ?? ''} F",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: AppColors.DWHITE0),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text("Distance: ",
                            style: TextStyle(color: AppColors.DWHITE0)),
                        Text(
                          "${ctlDrivermap.distanceDuree.value.distance ?? ''}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: AppColors.DWHITE0),
                        ),
                      ],
                    ),
                  ],
                ),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("MT PERÇU: ",
                            style: TextStyle(color: AppColors.DWHITE0)),
                        Text(
                          "${ctlcommande.commande.value.montantPercu ?? ''} F",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: AppColors.DWHITE0),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text("Dans: ",
                            style: TextStyle(color: AppColors.DWHITE0)),
                        Text(
                          "${ctlDrivermap.distanceDuree.value.duree ?? ''}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: AppColors.DWHITE0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(80.0)),
  );
}
