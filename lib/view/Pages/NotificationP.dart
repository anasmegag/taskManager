import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/controller/NotificationControll.dart';
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
          GetBuilder<NotificationControll>(
            init: NotificationControll(),
            builder: (c) {
              return FutureBuilder(
                future: c.creatNots(),
                builder: (context,snapshot) {
                 if(snapshot.hasData){
                   return Expanded(
                    child: ListView.builder(
                      //reverse: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_,i){
                        return MyNotification(not: snapshot.data![i]);
                      },
                    ),
                  );
                 }
                 else{
                  return const CircularProgressIndicator();
                 }
                }
              );
            }
          )

        ],
      ),
    );
  }
}