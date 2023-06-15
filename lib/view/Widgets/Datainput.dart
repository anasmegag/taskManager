import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/controller/TaskControll.dart';
import 'package:mytasks/model/Importance.dart';

class DataInput extends StatelessWidget {
 final TaskControll c = Get.put(TaskControll());
  DataInput(
      {Key? key,
      required this.name,
      required this.isChosable,
      this.controller,
      this.icon})
      : super(key: key);
  final String name;
  final bool isChosable;
  final TextEditingController? controller;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Consts.purpulsubTitle,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Consts.mainColor),
            ),
            child: !isChosable
                ? Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      // maxLines: 5,
                      style: Consts.purpulText,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (icon == Icons.calendar_month) {
                              c.date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2010),
                                      lastDate: DateTime(2026)) ??
                                  DateTime.now();
                            } else if (icon == Icons.timer) {
                              c.begintime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()) ??
                                  TimeOfDay.now();
                            } else if (icon == Icons.watch) {
                              c.endtime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()) ??
                                  TimeOfDay.now();
                            } else if (icon == Icons.notification_important) {
                              c.changeImportance();
                            }
                            c.updater();
                          },
                          icon: Icon(
                            icon,
                            color: Consts.sideColor,
                          ),
                        ),
                        GetBuilder<TaskControll>(
                            init: TaskControll(),
                            builder: (controller) {
                              if (name == 'Text') {
                                return Text(
                                  controller.title.text,
                                  style: Consts.purpulText,
                                );
                              } else if (name == "Date") {
                                return Text(
                                  DateFormat("yMd").format(controller.date),
                                  style: Consts.purpulText,
                                );
                              } else if (name == "Start Time") {
                                return Text(
                                  DateFormat("h:mm a").format(DateTime(
                                      2023,
                                      1,
                                      1,
                                      controller.begintime.hour,
                                      controller.begintime.minute)),
                                  style: Consts.purpulText,
                                );
                              } else if (name == "End Time") {
                                return Text(
                                  DateFormat("h:mm a").format(DateTime(
                                      2023,
                                      1,
                                      1,
                                      controller.endtime.hour,
                                      controller.endtime.minute)),
                                  style: Consts.purpulText,
                                );
                              } else if (name == "Description") {
                                return Text(
                                  controller.discreption.text,
                                  style: Consts.purpulText,
                                );
                              } else {
                                if (controller.importance ==
                                    Importance.notImportant) {
                                  return Text(
                                    "Not important",
                                    style: Consts.purpulText,
                                  );
                                } else if (controller.importance ==
                                    Importance.normal) {
                                  return Text(
                                    "Normal",
                                    style: Consts.purpulText,
                                  );
                                } else if (controller.importance ==
                                    Importance.imprtant) {
                                  return Text(
                                    "Imporant",
                                    style: Consts.purpulText,
                                  );
                                } else {
                                  return Text(
                                    "Urgent",
                                    style: Consts.purpulText,
                                  );
                                }
                              }
                            })
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
