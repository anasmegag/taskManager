import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';

class DataInput extends StatelessWidget {
  DataInput(
      {Key? key,
      required this.name,
      required this.isChosable,
      this.controller,
      this.icon})
      : super(key: key);
  final String name;
  final bool isChosable;
  final TextEditingController? controller;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Consts.purpulsubTitle,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Consts.mainColor),
            ),
            child: !isChosable
                ? Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                     // maxLines: 5,
                      style: Consts.purpulText,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            icon,
                            color: Consts.sideColor,
                          ),
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
