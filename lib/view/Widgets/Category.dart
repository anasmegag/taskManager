import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/model/categoriesM.dart';
import 'package:get/get.dart';
// ignore: must_be_immutable
class Category extends StatelessWidget {
  Category({Key? key, required this.model}) : super(key: key);
  CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("zz");
        Get.toNamed("/ss",);
      },
      child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              color: Consts.sideColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.name,
                    style: Consts.purpulsubTitle,
                  ),
                  Text(
                    "${model.num} tasks",
                    style: Consts.purpulText,
                  )
                ],
              ),
              Icon(
                model.icon,
                size: 40,
                color: Consts.mainColor,
              )
            ],
          )),
    );
  }
}
