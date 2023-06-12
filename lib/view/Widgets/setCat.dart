import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/view/Widgets/Category.dart';


class SetCategories extends StatelessWidget {
const  SetCategories({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Rect,
      color: Consts.mainColor,
      dashPattern: const [7, 2],
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: Consts.purpulsubTitle,
            ),
           Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: Consts.cats.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 18,childAspectRatio: 1.9),
                itemBuilder: (_,i){
                  return Category(model: Consts.cats[i]);
                },
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
