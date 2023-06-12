import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/view/Pages/NotificationP.dart';
//import 'package:mytasks/view/Pages/CalenderP.dart';

//import 'package:mytasks/view/Pages/ProfileP.dart';
// import 'package:mytasks/view/Pages/HomeP.dart';

class SetPages extends StatelessWidget {
  const SetPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.backgroundColor,
      body: NotificationsPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Consts.backgroundColor,
        elevation: 0,
        currentIndex: 3,
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Consts.backgroundColor,
            icon: Icon(
              Icons.home,
              color: Colors.grey,
              size: 35,
            ),
            label: "",
            activeIcon: Icon(
              size: 35,
              Icons.home,
              color: Consts.mainColor,
            ),
          ),
          const BottomNavigationBarItem(
            backgroundColor: Consts.backgroundColor,
            icon: Icon(
              size: 35,
              Icons.calendar_month,
              color: Colors.grey,
            ),
            label: "",
            activeIcon: Icon(
              Icons.calendar_month,
              size: 35,
              color: Consts.mainColor,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Consts.backgroundColor,
            icon: Container(
              decoration: BoxDecoration(
                color: Consts.mainColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Icon(
                Icons.add,
                color: Consts.backgroundColor,
                size: 50,
              ),
            ),
            label: "",
            activeIcon: Container(
              decoration: BoxDecoration(
                color: Consts.mainColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Icon(
                Icons.add,
                color: Consts.backgroundColor,
                size: 50,
              ),
            ),
          ),
          const BottomNavigationBarItem(
            backgroundColor: Consts.backgroundColor,
            icon: Icon(
              size: 35,
              Icons.notifications,
              color: Colors.grey,
            ),
            label: "",
            activeIcon: Icon(
              size: 35,
              Icons.notifications,
              color: Consts.mainColor,
            ),
          ),
          const BottomNavigationBarItem(
            backgroundColor: Consts.backgroundColor,
            icon: Icon(
              size: 35,
              Icons.person,
              color: Colors.grey,
            ),
            label: "",
            activeIcon: Icon(
              size: 35,
              Icons.person,
              color: Consts.mainColor,
            ),
          )
        ],
      ),
    );
  }
}
