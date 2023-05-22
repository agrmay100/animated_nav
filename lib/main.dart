import 'package:bottom_nav/components/gbutton.dart';
import 'package:bottom_nav/components/gnav.dart';
import 'package:bottom_nav/home_screen.dart';
import 'package:bottom_nav/navbar.dart';
import 'package:bottom_nav/sample.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CarouselController buttonCarouselController = CarouselController();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 20,
      //   title: const Text('GoogleNavBar'),
      // ),
      body: Center(
        child: carousel(context),
      ),
      bottomNavigationBar: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            setState(() {
              _selectedIndex += 1;
            });
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {
            setState(() {
              _selectedIndex -= 1;
            });
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                // rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                // haptic: true, // haptic feedback
                tabBorderRadius: 0,
                tabActiveBorder: Border.all(color: Colors.blueAccent, width: 2), // tab button border
                tabBorder: Border.all(color: Colors.blueAccent, width: 2), // tab button border
                // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                curve: Curves.ease, // tab animation curves
                duration: const Duration(milliseconds: 200), // tab animation duration
                gap: 5, // the tab button gap between icon and text
                color: Colors.black, // unselected icon color
                activeColor: Colors.black, // selected icon and text color
                iconSize: 24, // tab button icon size
                tabBackgroundColor: Colors.lightBlue, // selected tab background color
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                style: GnavStyle.google,
                // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5), // navigation bar padding
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'home',
                    gap: 10,
                  ),
                  GButton(
                    icon: Icons.heart_broken,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.verified_user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  buttonCarouselController.animateToPage(
                      index, duration: const Duration(milliseconds: 800),
                      curve: Curves.ease);
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget carousel(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      items: _widgetOptions,
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
            _selectedIndex = index;
          })
        },
      ),
    );
  }
}
