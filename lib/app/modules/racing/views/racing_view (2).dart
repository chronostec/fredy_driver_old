import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/racing_controller.dart';

class RacingView extends GetView<RacingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RacingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RacingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
