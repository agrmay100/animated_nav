import 'package:flutter/material.dart';

const List<Tab> myTabs = <Tab>[
  Tab(
    text: 'Areas',
    icon: Icon(Icons.architecture),
  ),
  Tab(
    text: 'Leaderboard',
    icon: Icon(Icons.leaderboard),
  ),
  Tab(
    text: 'Home',
    icon: Icon(Icons.home),
  ),
  Tab(
    text: 'Teams',
    icon: Icon(Icons.person),
  ),
  Tab(
    text: 'Collection',
    icon: Icon(Icons.collections),
  ),
];


const List<Widget> widgetOptions = <Widget>[
  Center(
    child: Text(
      'Areas',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ),
  Center(
    child: Text(
      'Leaderboard',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ),
  Center(
    child: Text(
      'Home',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ),
  Center(
    child: Text(
      'Teams',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ),
  Center(
    child: Text(
      'Collection',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ),
];
