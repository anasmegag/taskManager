import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasks/Helper/Consts.dart';

import '../../controller/TaskControll.dart';
import '../Widgets/ChooseCate.dart';
import '../Widgets/Datainput.dart';

class AddTask extends StatelessWidget {
 AddTask({Key? key}) : super(key: key);
  final TaskControll c = Get.put(TaskControll());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Consts.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Creat Task",
          style: Consts.purpulTitle,
        ),
      ),
      backgroundColor: Consts.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          children: [
            DataInput(
              name: 'Title',
              isChosable: false,
              controller: c.title,
            ),
            DataInput(
              name: 'Date',
              isChosable: true,
              icon: Icons.calendar_month,
            ),
            Row(
              children: [
                Expanded(
                    child: DataInput(
                  name: 'Start Time',
                  isChosable: true,
                  icon: Icons.timer,
                )),
                Expanded(
                    child: DataInput(
                  name: 'End Time',
                  isChosable: true,
                  icon: Icons.watch,
                )),
              ],
            ),
            ChooseCategory(),
            DataInput(
              name: 'Description',
              isChosable: false,
              controller: c.discreption,
            ),
            DataInput(
              name: 'Importance',
              isChosable: true,
              icon: Icons.notification_important,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Consts.sideColor),
                    elevation: MaterialStateProperty.all(3),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                  ),
                  onPressed: () {
                    Get.offAllNamed("/");
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Consts.mainColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Consts.mainColor),
                      elevation: MaterialStateProperty.all(5),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    onPressed: () {
                    c.cheacker();
                    },
                    child: Text(
                      "Save Task",
                      style: Consts.whiteText,
                    ),
                  ),
                )
              ],
            ),
            GetBuilder<TaskControll>(
              init: TaskControll(),
              builder: (controller){
              return Center(child: Text(controller.txtError,style:const TextStyle(color: Colors.red),));
            })
          ],
        ),
      ),
    );
  }
}
