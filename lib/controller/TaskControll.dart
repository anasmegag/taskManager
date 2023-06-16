import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:mytasks/model/Importance.dart';
import 'package:flutter/material.dart';
import 'package:mytasks/model/TaskModel.dart';

class TaskControll extends GetxController {
  TextEditingController title = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay begintime = TimeOfDay.now();
  TimeOfDay endtime = TimeOfDay.now();
  static var idBox = GetStorage();
  String category = "";
  TextEditingController discreption = TextEditingController();
  Importance importance = Importance.notImportant;
  


  //this function will add the task to the box


  //choose category from the categories to add it
  chooseCat(String x) {
    category = x;
    update();
    
  }

  List<Importance> imps = [
    Importance.notImportant,
    Importance.normal,
    Importance.imprtant,
    Importance.urgent
  ];
  int i = 0;
  changeImportance() {
    i == 3 ? i = 0 : i++;
    importance = imps[i];

    update();
  }

  updater() {
    update();
  }
}
