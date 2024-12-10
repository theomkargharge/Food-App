import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  AnimationController? animationController;



  void animationFunction() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      animationBehavior: AnimationBehavior.preserve,
    );
    animationController?.addListener(() {
      if (animationController!.isCompleted) {
        animationController?.repeat();
      }
      update();
    });
    animationController?.forward();
  }


  
  var listRadius = [200, 250, 300, 350, 400];

  @override
  void onInit() {
    animationFunction();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/getStarted');
    });

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController?.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    animationController?.dispose();
    super.onClose();
  }
}
