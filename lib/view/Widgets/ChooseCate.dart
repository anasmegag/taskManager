import 'package:flutter/material.dart';
import 'package:mytasks/controller/TaskControll.dart';
import 'package:get/get.dart';
import '../../Helper/Consts.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: Consts.purpulsubTitle,
          ),
          const SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              children: Consts.cats
                  .map((e) => GetBuilder<TaskControll>(
                    init: TaskControll(),
                    builder: (c) {
                      return GestureDetector(
                        
                        onTap: (){
                          c.chooseCat(e.name);
                        },
                        child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 4),
                              alignment: Alignment.center,
                              height: 30,
                              decoration: BoxDecoration(
                                color:c.category==e.name? Consts.sideColor: Consts.mainColor,
                                borderRadius: BorderRadius.circular(20),
                                //  border:c.category==e.name? Border.all(color: Consts.sideColor,width: 3):Border()
                              ),
                              child: Text(
                                e.name,
                                style:c.category==e.name?Consts.purpulText: Consts.whiteText,
                              ),
                            ),
                      );
                    }
                  ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
