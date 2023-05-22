import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';



class PosController extends GetxController{

  double barPosition = 0.0;

  scrollPosition(i){
    barPosition = i;
    update();
  }

}