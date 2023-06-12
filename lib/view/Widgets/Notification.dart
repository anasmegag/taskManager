import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';

class MyNotification extends StatelessWidget {
  const MyNotification({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right:15,top: 10,),
      decoration: BoxDecoration(color: Consts.sideColor,borderRadius: BorderRadius.circular(20),),
      height: 100,
      child: Text(text,style: Consts.purpulText,),
    );
  }
}