import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyProgress extends StatelessWidget {
  const MyProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 22),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
          color: Consts.mainColor, borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * 0.22,
      width: 350,
      child: Column(
        children: [
          Text(
            "62.5% completed",
            style: Consts.whiteText,
          ),
          Container(
            width: 312,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  width: 310,
                  lineHeight: 12,
                  percent: .6521,
                  barRadius: const Radius.circular(30),
                  backgroundColor: Consts.mainColor,
                  linearGradient: const LinearGradient(
                      colors: [Consts.sideColor, Colors.grey]),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You have 3 more tasks to do!",
                      style: Consts.whitesubTitle,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Consts.sideColor),
                        ),
                        child: Text(
                          "Details",
                          style: Consts.purpulText,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Image(
                image: AssetImage("assets/photo3.png"),
                height: 120,
                width: 120,
              )
            ],
          )
        ],
      ),
    );
  }
}
