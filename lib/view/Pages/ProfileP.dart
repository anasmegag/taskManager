import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/view/Widgets/Myprogress.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Consts.backgroundColor,
      padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.5),
            child: Text(
              "Profile",
              style: Consts.purpulsubTitle,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.5),
            child: Row(
              children: [
                const SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Anas",
                  style: Consts.bigPurpulTitle,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const MyProgress(),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Consts.sideColor),
            width: double.infinity,
            child: Row(
              children: [
                const Icon(Icons.person_2,color: Consts.mainColor,),
                Text(
                  "Change Information",
                  style: Consts.purpulText,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Consts.sideColor),
            width: double.infinity,
            child: Row(
              children: [
               const Icon(Icons.photo,color: Consts.mainColor,),
                Text(
                  "Change picture",
                  style: Consts.purpulText,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Consts.sideColor),
            child: Row(
              children: [
                const Icon(Icons.delete,color: Consts.mainColor,),
                Text(
                  "Delete account",
                  style: Consts.purpulText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
