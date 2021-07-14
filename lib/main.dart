import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location_screen.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/location": (context) => ChooseLocation(),
    },
  ));
}