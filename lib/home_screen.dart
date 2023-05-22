import 'package:bottom_nav/components/controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'animated_tab.dart';
import 'package:bottom_nav/components/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(Controller());


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: GetBuilder<Controller>(builder: (controller) {
        final selectedIndex = controller.index;

        return GestureDetector(
            // onPanUpdate: (details) {
            //   print(details.delta.dx);
            // },
            onPanEnd: (details) {
              // Swiping in right direction.
              if (details.velocity.pixelsPerSecond.dx > 0) {
                if (selectedIndex > 0) {
                  controller.pageToAnimate(selectedIndex - 1);
                }
              }

              // Swiping in left direction.
              if (details.velocity.pixelsPerSecond.dx < 0) {
                if (selectedIndex < 4) {
                  controller.pageToAnimate(selectedIndex + 1);
                }
              }
            },
            child: AnimatedTabView());
      }),
      body: Stack(
        children: [
          GetBuilder<Controller>(builder: (controller) {
            final selectedIndex = controller.index;
            return CarouselSlider(
              items: widgetOptions,
              carouselController: controller.carouselController,
              options: CarouselOptions(
                  height: height,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                  // aspectRatio: 2.0,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  onScrolled: ((value) {
                    if(value! > selectedIndex){
                      if(value! > selectedIndex && value! <= (selectedIndex + 0.5)){
                        controller.scrollPosition(value);
                      }
                      if(value! > (selectedIndex + 0.5) && value! < (selectedIndex + 1)){
                        controller.scrollPosition((selectedIndex +1).toDouble());
                        // controller.setIndex(selectedIndex +1);
                      }
                    }
                    else{
                      if(value! < selectedIndex && value! >= (selectedIndex - 0.5)){
                        controller.scrollPosition(value);
                      }
                      if(value! < (selectedIndex - 0.5) && value! > (selectedIndex - 1)){
                        controller.scrollPosition((selectedIndex -1).toDouble());
                        // controller.setIndex(selectedIndex -1);
                      }
                    }

                    // print(value);
                  })
                  // onPageChanged: (index, reason) {
                  //   final selIndex = controller.index;
                  //
                  //   controller.setIndex(index)
                  // },
                  ),
            );
          }),
          GetBuilder<Controller>(
            builder: (controller) {
              final selectedIndex = controller.index;
              return GestureDetector(
                onPanEnd: (details) {
                  // Swiping in right direction.
                  if (details.velocity.pixelsPerSecond.dx > 0) {
                    if (selectedIndex > 0) {
                      controller.pageToAnimate(selectedIndex - 1);
                    }
                  }

                  // Swiping in left direction.
                  if (details.velocity.pixelsPerSecond.dx < 0) {
                    if (selectedIndex < 4) {
                      controller.pageToAnimate(selectedIndex + 1);
                    }
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  height: height - 60,
                  width: width,
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
