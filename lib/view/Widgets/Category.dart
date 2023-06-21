import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/controller/TaskControll.dart';
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
        
        Get.toNamed("/ss",arguments: TaskControll.showTasksonCat(model.name));
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
                  FutureBuilder(
                    future: TaskControll.showTasksonCat(model.name),
                    builder: (context,snapshot) {
                      if(snapshot.hasData){
                        return Text(
                        "${snapshot.data!.length} tasks",
                        style: Consts.purpulText,
                      );
                      }
                      else {
                        return Text(
                        "0 tasks",
                        style: Consts.purpulText,
                      );
                      }
                    }
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
