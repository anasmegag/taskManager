import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/controller/TaskControll.dart';
import 'package:mytasks/controller/UserControll.dart';
import 'package:mytasks/view/Widgets/Myprogress.dart';
import 'package:get/get.dart';
class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);
final  UserControll c = Get.put(UserControll());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Consts.backgroundColor,
      padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.5),
            child: Text(
              "Profile",
              style: Consts.purpulsubTitle,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.5),
            child: Row(
              children: [
                const SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "${UserControll.box.read('name')}",
                  style: Consts.bigPurpulTitle,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          MyProgress(),
          const SizedBox(
            height: 15,
          ),
          Setting(text: "Show all Tasks",icon: Icons.task,f1: (){
            Get.toNamed("/ss",arguments: TaskControll().readData());
          }),
          Setting(text: "Change Information",icon: Icons.person_2,f1: (){
                
          }),
          Setting(text: "Change Picture",icon: Icons.photo,f1: (){}),
          Setting(text: "Delete Account",icon: Icons.delete,f1: (){
            c.deleteUser();
          }),
          
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  GestureDetector Setting({required String  text ,required IconData icon ,required Function f1}) {
    return GestureDetector(
          onTap: (){
            f1();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Consts.sideColor),
            width: double.infinity,
            child: Row(
              children: [
                 Icon(icon,color: Consts.mainColor,),
                Text(
                  text,
                  style: Consts.purpulText,
                ),
              ],
            ),
          ),
        );
  }
}
