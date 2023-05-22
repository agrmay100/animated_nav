import 'package:bottom_nav/components/constants.dart';
import 'package:bottom_nav/components/controller.dart';
import 'package:bottom_nav/components/position_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedTabView extends StatelessWidget {
  AnimatedTabView({Key? key}) : super(key: key);

  final controller = Get.find<Controller>();

  final tabHeight = 60.0;

  // int tabIndex = 0;
  static const _duration = Duration(milliseconds: 400);
  static const curve = Curves.ease;

  static const _durationIcon = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = controller.index;
    double displayWidth = MediaQuery.of(context).size.width;
    double widthActive = displayWidth * .30;
    double widthInactive = (displayWidth - widthActive) / (myTabs.length - 1);

    // print(selectedIndex);

    return Container(
      color: const Color(0xFF016EBE),
      height: tabHeight,
      child: Stack(
        children: [
          Row(
              children: myTabs.asMap().entries.map((e) {
            final index = e.key;
            final tab = e.value;
            final isActive = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                controller.pageToAnimate(index);
              },
              child: AnimatedContainer(
                  duration: _duration,
                  curve: curve,
                  // margin: const EdgeInsets.all(5.0),
                  height: tabHeight,
                  width: isActive ? widthActive : widthInactive,
                  decoration: BoxDecoration(
                      color: const Color(0xFF016EBE),
                      border:
                          Border.all(color: const Color(0xFF01447E), width: 1)),
                  child: Container()),
            );
          }).toList()),


            AnimatedAlign(
                duration: _duration,
                curve: Curves.linear,
                alignment:
                    FractionalOffset(1 / (myTabs.length - 1) * selectedIndex, 0),
                child: Container(
                  height: tabHeight,
                  color: const Color(0xFF1490FF).withOpacity(0.4),
                  child: FractionallySizedBox(
                    widthFactor: 1 / myTabs.length + 0.094,
                    child: const Text(''),
                  ),
                ),

          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: myTabs.asMap().entries.map((e) {
                final index = e.key;
                final tab = e.value;
                final isActive = index == selectedIndex;
                // print(isActive);

                return Flexible(
                  child: GestureDetector(
                    onTap: () {
                      controller.pageToAnimate(index);
                    },
                    child: AnimatedAlign(
                      duration: _duration,
                      curve: curve,
                      alignment: FractionalOffset(
                          isActive
                              ? (2 - index) * 0.28
                              : index > selectedIndex
                                  ? (5 - index) * 0.25
                                  : -index * 0.3,
                          0),
                      child: AnimatedScale(
                        duration: _durationIcon,
                        curve: Curves.easeInOutBack,
                        scale: isActive ? 2.5 : 1.5,
                        child: AnimatedSlide(
                          duration: _durationIcon,
                          curve: Curves.easeInOutBack,
                          offset: Offset(0, isActive ? -0.19 : 0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18, left: 18),
                            child: Column(
                              children: [
                                tab.icon ??
                                    const Icon(Icons.access_alarms_rounded),
                                if (isActive)
                                  Text(
                                    tab.text ?? "",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFEEF3F6)),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList())
        ],
      ),
    );
  }
}
