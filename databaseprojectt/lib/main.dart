// ignore_for_file: prefer_const_constructors, unused_import
import 'package:databaseprojectt/sign_up.dart';
import 'package:http/http.dart' as http;

import 'package:databaseprojectt/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight Tickets',
      home: HomePage(),
    );
  }
}
