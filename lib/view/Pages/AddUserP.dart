import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';

//
// ignore: must_be_immutable
class AddUserPage extends StatelessWidget {
  AddUserPage({Key? key}) : super(key: key);
  String sex = 'Male';
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
                    Container(
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
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Name",
                            hintStyle: Consts.purpulText),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Consts.sideColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            sex,
                            style: Consts.purpulText,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          DropdownButton<String>(
                              // value:sex ,
                              items: const [
                                DropdownMenuItem(
                                  value: "Male",
                                  child: Text("Male"),
                                ),
                                DropdownMenuItem(
                                  value: "Female",
                                  child: Text("Female"),
                                ),
                              ],
                              onChanged: (v) {
                                sex = v!;
                              })
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
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
                          "Add Profile",
                          style: Consts.whiteTitle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
