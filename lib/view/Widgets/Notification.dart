import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/controller/NotificationControll.dart';
import 'package:mytasks/model/NotificationM.dart';

class MyNotification extends StatelessWidget {
  const MyNotification({Key? key, required this.not}) : super(key: key);
  final NotificationModell not;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        right: 15,
        top: 10,
      ),
      decoration: BoxDecoration(
        color:NotificationControll.sendNotification(not.date)?Consts.sideColor: Consts.mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            not.name,
            style:NotificationControll.sendNotification(not.date)? Consts.purpulText:Consts.whiteText,
          ),
          Text(
            'at time :${DateFormat("h:mm a").format(DateTime(2023, 1, 1, not.date.hour, not.date.minute))}',
            style:NotificationControll.sendNotification(not.date)? Consts.purpulText:Consts.whiteText,
          )
        ],
      ),
    );
  }
}
