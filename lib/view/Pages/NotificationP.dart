import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/view/Widgets/Notification.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Text("Notifications",style: Consts.purpulTitle,),
          const SizedBox(height: 20,),
          Text("Today",style: Consts.purpulsubTitle,),
          Expanded(
            child: ListView(
              children: [
                MyNotification(text: "aj;lajlkjeak klhajklh kla hklkl jklh jkhlelkaj u klh lkjak jee ",),
                MyNotification(text: "aj;lajlkjeak klhajklh kla hklkl jklh jkhlelkaj u klh lkjak jee ",),
                MyNotification(text: "aj;lajlkjeak klhajklh kla hklkl jklh jkhlelkaj u klh lkjak jee ",),
              ],
            ),
          )

        ],
      ),
    );
  }
}