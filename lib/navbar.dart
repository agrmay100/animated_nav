import 'package:bottom_nav/animated_tab_bar.dart';
import 'package:bottom_nav/components/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({super.key});

  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {

  // late TabController _tabController;
  CarouselController buttonCarouselController = CarouselController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onPanEnd: (details) {
          // Swiping in right direction.
          if (details.velocity.pixelsPerSecond.dx > 0) {
            if(selectedIndex > 0){
              setState(() {
                selectedIndex -= 1;
              });
            }
          }

          // Swiping in left direction.
          if (details.velocity.pixelsPerSecond.dx < 0) {
            if(selectedIndex < 4){
              setState(() {
                selectedIndex += 1;
              });

            }
          }
        },
        child: AnimatedTabBar(
          tabs: myTabs,
          tabIndex: selectedIndex,
          // controller: _tabController,
          carouselController: buttonCarouselController,
        ),
      ),
      body: Container(
        color: Colors.amberAccent,
        child:
        Center(
          child: carousel(context))
        // TabBarView(
        //   controller: _tabController,
        //   children: myTabs.map((Tab tab) {
        //     final String label = tab.text!.toLowerCase();
        //     return Center(
        //       child: Text(
        //         'This is the $label tab',
        //         style: const TextStyle(fontSize: 36),
        //       ),
        //     );
        //   }).toList(),
        // ),
      ),
    );
  }

  Widget carousel(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      items: widgetOptions,
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: height,
        autoPlay: false,
        enlargeCenterPage: false,
        viewportFraction: 1.0,
        // aspectRatio: 2.0,
        initialPage: 2,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) => {
          setState((){
            selectedIndex = index;
          })
        },
      ),
    );
  }
}

