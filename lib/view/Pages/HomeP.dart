import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';

import '../Widgets/Myprogress.dart';
import '../Widgets/setCat.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                const SizedBox(width: 10),
                RichText(
                  text: TextSpan(
                      text: "Hello, ",
                      style: Consts.purpulText,
                      children: [
                        TextSpan(text: "Anas", style: Consts.purpulTitle)
                      ]),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              "Let’s check out your today\'s task",
              style: Consts.purpulText,
            ),
          ),
         const MyProgress(),
         SetCategories()
        ],
      ),
    );
  }
}
