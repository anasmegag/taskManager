import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';

import '../Widgets/ChooseCate.dart';
import '../Widgets/Datainput.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

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
                  icon: Icons.timer,
                )),
              ],
            ),
            ChooseCategory(),
            DataInput(
              name: 'Description',
              isChosable: false,
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
                  onPressed: () {},
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
                    onPressed: () {},
                    child: Text(
                      "Save Task",
                      style: Consts.whiteText,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
