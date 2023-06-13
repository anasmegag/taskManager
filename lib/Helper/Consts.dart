import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytasks/view/Pages/AddTask.dart';
import 'package:mytasks/view/Pages/CalenderP.dart';
import 'package:mytasks/view/Pages/HomeP.dart';
import 'package:mytasks/view/Pages/NotificationP.dart';
import 'package:mytasks/view/Pages/ProfileP.dart';

import '../model/categoriesM.dart';

class Consts {
  static const Color mainColor = Color.fromRGBO(99, 105, 217, 1);
  static const Color sideColor = Color.fromRGBO(209, 208, 249, 1);
  static const Color backgroundColor = Color.fromRGBO(246, 242, 255, 1);

  static TextStyle bigPurpulTitle = GoogleFonts.poppins(
      color: mainColor, fontSize: 33, fontWeight: FontWeight.bold);

  static TextStyle purpulTitle = GoogleFonts.poppins(
      color: mainColor, fontSize: 25, fontWeight: FontWeight.bold);

  static TextStyle purpulsubTitle = GoogleFonts.poppins(
      color: mainColor, fontSize: 18, fontWeight: FontWeight.w700);

  static TextStyle purpulText =
      GoogleFonts.poppins(color: mainColor, fontSize: 14);

  static TextStyle whiteTitle = GoogleFonts.poppins(
      color: backgroundColor, fontSize: 25, fontWeight: FontWeight.bold);

  static TextStyle whitesubTitle = GoogleFonts.poppins(
      color: backgroundColor, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle whiteText = GoogleFonts.poppins(
    color: backgroundColor,
    fontSize: 17,
  );

  static List<CategoryModel> cats = [
    CategoryModel(name: "Study", num: 22, icon: Icons.book),
    CategoryModel(name: "ًWork", num: 15, icon: Icons.work),
    CategoryModel(name: "Home", num: 3, icon: Icons.home),
    CategoryModel(name: "Project", num: 11, icon: Icons.computer),
    CategoryModel(name: "Social", num: 0, icon: Icons.message),
    CategoryModel(name: "Other", num: 32, icon: Icons.all_out),
  ];

  static  List<Widget> pages = [
    const HomePage(),
    CalenderPage(),
    const AddTask(),
    const NotificationsPage(),
    const ProfilePage()
  ];
}
