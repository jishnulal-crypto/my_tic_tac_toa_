import 'package:flutter/material.dart';
import 'package:project/alert_screen.dart';
import 'package:project/draw_screen.dart';
import 'package:project/icon_widgets.dart';
import 'package:project/play_screen.dart';
import 'package:project/utils.dart';
import 'package:project/win_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PlayGround()),
    );
  }
}
