import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/model/TaskModel.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Task extends StatelessWidget {
  Task({Key? key, required this.task}) : super(key: key);
  TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      height: 105,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Consts.sideColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            task.category,
            style: Consts.purpulText,
          ),
          Text(
            task.title,
            style: Consts.purpulsubTitle,
          ),
          Row(
            children: [
              const Icon(
                Icons.timelapse,
                color: Consts.mainColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${DateFormat("h:mm a").format(task.begin)} - ${DateFormat("h:mm a").format(task.end)}",
                style: Consts.purpulText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
