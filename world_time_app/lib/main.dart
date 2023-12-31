
import 'package:flutter/material.dart';
import 'package:world_time_app/screens/choose_location.dart';
import 'package:world_time_app/screens/home.dart';
import 'package:world_time_app/screens/loading.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },  
    ),
  );
}


