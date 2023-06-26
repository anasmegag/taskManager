import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/controller/TaskControll.dart';
import 'package:mytasks/model/Status.dart';
import 'package:mytasks/model/TaskModel.dart';
import 'package:intl/intl.dart';

class Task extends StatelessWidget {
  Task({Key? key, required this.task}) : super(key: key);
  final TaskModel task;
  final TaskControll c = Get.put(TaskControll());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Get.defaultDialog(
            backgroundColor: Consts.mainColor,
            title: "Settings",
            titleStyle: Consts.whitesubTitle,
            content: Row(
              mainAxisAlignment:task.status!= Status.done? MainAxisAlignment.spaceAround:MainAxisAlignment.center,
              children: [
              task.status==Status.done? Container():  ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/a',arguments: task);
                    c.toUpdate=true;
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Consts.sideColor),
                  ),
                  child: Text(
                    "Edit Task",
                    style: Consts.purpulText,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    c.deleteDask(task.id);
                    Get.offAllNamed("/");
                    Get.snackbar('Deleted', 'Task deleted',
                        duration:const Duration(seconds: 2),
                        backgroundColor: Consts.mainColor,
                        colorText: Consts.sideColor,
                        snackPosition: SnackPosition.BOTTOM,
                        snackStyle: SnackStyle.FLOATING);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Consts.sideColor),
                  ),
                  child: Text(
                    "Delete",
                    style: Consts.purpulText,
                  ),
                ),
              ],
            ));
      },
      onDoubleTap: (){
        print(task.status);
      },
      onTap: () {
        Get.defaultDialog(
            backgroundColor: Consts.mainColor,
            title: task.title,
            titleStyle: Consts.whitesubTitle,
            content: Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.discreption,
                    style: Consts.whiteText,
                  ),
                  Text(
                    "Category: ${task.category}",
                    style: Consts.whitesubTitle,
                  ),
                  Text(
                    "Date : ${DateFormat("yMd").format(task.date)}",
                    style: Consts.whiteText,
                  ),
                  Text(
                    "Begin time : ${DateFormat("h:mm a").format(task.begin)}",
                    style: Consts.whiteText,
                  ),
                  Text(
                    "End time : ${DateFormat("h:mm a").format(task.end)}",
                    style: Consts.whiteText,
                  ),
                  GetBuilder<TaskControll>(
                      init: TaskControll(),
                      builder: (controller) {
                        return Text(
                          "status: ${task.status==Status.todo? 'to do':task.status==Status.done?'done':'undone'}",
                          style: Consts.whitesubTitle,
                        );
                      }),
                  task.status != Status.done
                      ? Center(
                          child: ElevatedButton(
                            onPressed: () {
                              c.taskDone(task.id);
                              Get.offAllNamed('/');
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Consts.sideColor),
                            ),
                            child: Text(
                              "Done",
                              style: Consts.purpulText,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: 105,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color:task.status==Status.done?Consts.mainColor: Consts.sideColor, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              task.category,
              style:task.status==Status.done?Consts.whiteText: Consts.purpulText,
            ),
            Text(
              task.title,
              style:task.status==Status.done?Consts.whitesubTitle: Consts.purpulsubTitle,
            ),
            Row(
              children: [
                Icon(
                  Icons.timelapse,
                  color: task.status==Status.done?Consts.backgroundColor: Consts.mainColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${DateFormat("h:mm a").format(task.begin)} - ${DateFormat("h:mm a").format(task.end)}",
                  style: task.status==Status.done?Consts.whiteText: Consts.purpulText
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
