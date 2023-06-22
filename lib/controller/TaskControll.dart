import 'package:get/get.dart';
import 'package:mytasks/Helper/servises.dart';
import 'package:mytasks/model/Status.dart';
import 'package:mytasks/model/TaskModel.dart';
import 'package:isar/isar.dart';
import 'package:mytasks/model/Importance.dart';
import 'package:flutter/material.dart';

class TaskControll extends GetxController {
  TextEditingController title = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay begintime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endtime = const TimeOfDay(hour: 0, minute: 0);
  String category = "";
  TextEditingController discreption = TextEditingController();
  Importance importance = Importance.notImportant;
  String txtError = '';
  bool toUpdate = false;

  //this function will add the task to the db
  cheacker() {
    if (title.text == '') {
      txtError = 'no title';
    } else if (category == '') {
      txtError = 'select category';
    } else if (date.year < DateTime.now().year ||
        (date.year == DateTime.now().year &&
            date.month < DateTime.now().month) ||
        ((date.year == DateTime.now().year &&
            date.month == DateTime.now().month &&
            date.day < DateTime.now().day))) {
      txtError = 'wrong date';
    } else if (begintime.hour > endtime.hour ||
        (begintime.hour == endtime.hour && begintime.minute > endtime.minute)) {
      txtError = "wrong time to start or to begin";
    } else {
      addTask();
      Get.offAllNamed("/");
    }
    update();
  }

  addTask() async {
    final isar = await IsarServices().db;
    var tasks = isar.collection<TaskModel>();
    await isar.writeTxn(() async {
      await tasks.put(TaskModel(
        date: DateTime(date.year, date.month, date.day),
        title: title.text,
        category: category,
        discreption: discreption.text,
        begin: DateTime(
          date.year,
          date.month,
          date.day,
          begintime.hour,
          begintime.minute,
        ),
        end: DateTime(
          date.year,
          date.month,
          date.day,
          endtime.hour,
          endtime.minute,
        ),
        status: Status.todo,
        importance: importance,
      ));
    });
  }

  //this function is used to read from the db and desplay it

  Future<List<TaskModel>> readData() async {
    final isar = await IsarServices().db;
    var tasks = isar.collection<TaskModel>();
    return await tasks.where().findAll();
  }

  //the same thing but in categories
  static Future<List<TaskModel>> showTasksonCat(String cat) async {
    final isar = await IsarServices().db;
    final tasks = isar.collection<TaskModel>();
    return tasks.filter().categoryEqualTo(cat).findAll();
  }

  // this function is used to delete a task
  deleteDask(Id id) async {
    final isar = await IsarServices().db;
    final tasks = isar.collection<TaskModel>();
    isar.writeTxn(() async {
      await tasks.delete(id);
    });
  }

  // this function is to set the finish the task
  taskDone(Id id) async {
    final isar = await IsarServices().db;
    final tasks = isar.collection<TaskModel>();
    isar.writeTxn(() async {
      var task = await tasks.get(id);
      task!.status = Status.done;
      await tasks.put(task);
    });

    update();
  }

 Future<List<dynamic>> todayProgress() async {
    //this funnction is used to get the today progress
    int num = 0;
    double percent = 0;
    final isar = await IsarServices().db;
    final tasks = isar.collection<TaskModel>();
    final undonetodayTasks = await tasks
        .filter()
        .dateEqualTo(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .group((q) =>
            q.statusEqualTo(Status.todo).or().statusEqualTo(Status.undone))
        .findAll();
    num = undonetodayTasks.length;
    final alltodaytask = await tasks
        .filter()
        .dateEqualTo(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .findAll();
    var num2 = alltodaytask.length;
    if (num2 == 0) {
      percent = 1;
    } else {
      percent = (num2 - num) / num2;
    }
    return [num, percent,num2-num];
  }

  //choose category from the categories to add it also chose importance
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
