import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AnimatedTabBar extends StatefulWidget {
  const AnimatedTabBar(
      {Key? key,
      required this.tabs,
      required this.tabIndex,
      required this.carouselController})
      : super(key: key);

  final List<Tab> tabs;
  final int tabIndex;
  final CarouselController carouselController;

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar> {
  final tabHeight = 60.0;
  // int tabIndex = 0;
  static const _duration = Duration(milliseconds: 600);
  static const curve = Curves.ease;

  static const _durationIcon = Duration(milliseconds: 100);

  // late final AnimationController expandController;

  void pageAnimate(index){
    widget.carouselController.animateToPage(index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease);
    // widget.controller.animateTo(index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.controller.addListener(() {
    //   setState(() {
    //     tabIndex = widget.controller.index;
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // tabIndex = widget.controller.index;
    double displayWidth = MediaQuery.of(context).size.width;
    double widthActive = displayWidth * .30;
    double widthInactive =
        (displayWidth - widthActive) / (widget.tabs.length - 1);

    return Container(
      color: const Color(0xFF016EBE),
      height: tabHeight,
      child: Stack(
        children: [
          Row(
              children: widget.tabs.asMap().entries.map((e) {
            final index = e.key;
            final tab = e.value;
            final isActive = index == widget.tabIndex;
            return GestureDetector(
              onTap: () {
                pageAnimate(index);
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
            curve: curve,
            alignment:
                FractionalOffset(1 / (widget.tabs.length - 1) * widget.tabIndex, 0),
            child: Container(
              height: tabHeight,
              color: const Color(0xFF1490FF).withOpacity(0.4),
              child: FractionallySizedBox(
                widthFactor: 1 / widget.tabs.length + 0.094,
                child: const Text(''),
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.tabs.asMap().entries.map((e) {
                final index = e.key;
                final tab = e.value;
                final isActive = index == widget.tabIndex;

                return Flexible(
                  child: GestureDetector(
                    onTap: () {
                      pageAnimate(index);
                    },
                    child: AnimatedAlign(
                      duration: _duration,
                      curve: curve,
                      alignment: FractionalOffset(
                          isActive
                              ? (2.5 - index) * 0.21
                              : index > widget.tabIndex
                                  ? (5 - index) * 0.25
                                  : -index * 0.3,
                          0),
                      child: AnimatedScale(
                        duration: _durationIcon,
                        curve: Curves.easeInOutBack,
                        scale: isActive ? 2.2 : 1.5,
                        child: AnimatedSlide(
                          duration: _durationIcon,
                          curve: Curves.easeInOutBack,
                          offset: Offset(0, isActive ? -0.15 : 0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, left: 18),
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
