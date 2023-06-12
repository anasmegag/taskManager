import 'package:flutter/material.dart';
//import 'package:mytasks/view/Pages/AddTask.dart';
//import 'package:mytasks/view/Pages/AddUserP.dart';
import 'package:mytasks/view/Pages/SetPages.dart';
//import 'package:mytasks/view/Pages/FirstP.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      
      home: SetPages(),
    );
  }
}