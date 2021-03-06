import 'dart:io';
import 'dart:ui';

import 'package:alfred_taxi_driver/app/constants/controllers.dart';
import 'package:alfred_taxi_driver/app/routes/app_pages.dart';
import 'package:alfred_taxi_driver/app/themes/colors/app_colors.dart';
import 'package:alfred_taxi_driver/app/utils/drawer_view.dart';
import 'package:alfred_taxi_driver/app/utils/images_path.dart';
import 'package:alfred_taxi_driver/app/utils/oval_right_clipper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/home_controller.dart';
import 'command_dispo_card.dart';
import 'popscopr_dialog.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key, this.gmapStyle}) : super(key: key);
  final gmapStyle;
  @override
  Widget build(BuildContext context) {
    print(gmapStyle);
    return WillPopScope(
        onWillPop: () async {
          return await popscopeDialog(context);
        },
        child: Obx(
          () => Scaffold(
            backgroundColor: AppColors.DGREEN1,
            key: ctlHome.ghomeKey,
            appBar: AppBar(
              title: const Text('Alfred Taxi'),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  ctlHome.ghomeKey.currentState!.openDrawer();
                },
              ),
            ),
            drawer: BuildDrawer(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  for (var commande in ctlcommande.listCommande)
                    ComandeDispoCard(commande),
                ],
              ),
            ),
          ),
        ));
  }
}
