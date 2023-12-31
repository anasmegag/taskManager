import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:get/get.dart';
import 'package:mytasks/controller/UserControll.dart';
//
// ignore: must_be_immutable
class AddUserPage extends StatelessWidget {
  AddUserPage({Key? key}) : super(key: key);
  final UserControll c1 = Get.put(UserControll());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/photo4.png"),
              width: 330,
              height: 180,
            ),
            DottedBorder(
              dashPattern:const [8,2],
              color: Consts.mainColor,
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 220,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GetBuilder<UserControll>(
                      init: UserControll(),
                      builder: (controller) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                               horizontal: 14),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Consts.sideColor),
                          child: TextFormField(
                            style: Consts.purpulText,
                            controller: controller.userName,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Name",
                                hintStyle: Consts.purpulText),
                          ),
                        );
                      }
                    ),
                    GetBuilder<UserControll>(
                      init: UserControll(),
                      builder: (controller) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                               horizontal: 14),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Consts.sideColor),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: Consts.purpulText,
                            controller: controller.age,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "age",
                                hintStyle: Consts.purpulText),
                          ),
                        );
                      }
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       c1.toUpdate? IconButton(onPressed: (){Get.back();}, icon:const Icon(Icons.arrow_back,color: Consts.mainColor,)):Container(),
                        InkWell(
                          onTap: () {
                            c1.createUser();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Consts.mainColor),
                            child: Text(
                             c1.toUpdate?"Update": "Add Profile",
                              style: Consts.whiteTitle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<UserControll>(
              init: UserControll(),
              builder: (controller){
              return Text(controller.errorText,style:const TextStyle(color: Colors.red),);
            })
          ],
        ),
      ),
    );
  }
}
