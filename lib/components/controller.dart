import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';



class Controller extends GetxController{

  var index = 0;
  double barPosition = 0.0;
  var build_ = true.obs;

  final carouselController = CarouselController();

  pageToAnimate(index){
    carouselController.animateToPage(index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease);
    setIndex(index);
    // widget.controller.animateTo(index);
  }

  setIndex(i){
    index = i;
    update();
  }

  setBuild(i){
    build_(i);
  }

  scrollPosition(i){
    barPosition = i;
    update();
  }

}