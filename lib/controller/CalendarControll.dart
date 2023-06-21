import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:mytasks/Helper/servises.dart';
import 'package:mytasks/model/TaskModel.dart';

class CalendarControll extends GetxController {
  DateTime chosenDate = DateTime.now();

  changeDate(DateTime selectedDate) {
    chosenDate = selectedDate;
    showTasksonDate();
    update();
  }

  //this function will return a list of tasks by
  // the condition of the chosen date
  Future<List<TaskModel>> showTasksonDate() async {
    final isar = await IsarServices().db;
    final tasks = isar.collection<TaskModel>();
    return tasks
        .filter()
        .dateEqualTo(
            DateTime(chosenDate.year, chosenDate.month, chosenDate.day))
        .findAll();
  }
}
