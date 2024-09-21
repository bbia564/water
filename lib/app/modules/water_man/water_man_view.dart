import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'water_man_logic.dart';

class WaterManView extends GetView<PageLogic> {
  const WaterManView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.schaefer.value
              ? const CircularProgressIndicator(color: Colors.cyan)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.horptj();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
