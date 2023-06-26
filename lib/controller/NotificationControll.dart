import 'package:get/get.dart';
import 'package:isar/isar.dart';
import '../Helper/servises.dart';
import '../model/NotificationM.dart';
import '../model/TaskModel.dart';

class NotificationControll extends GetxController{
  //this function will generate a list
  //this list will have notification models
  //for each task we'll have 2 notifications for begin and end
  // after this will will deal with the color and time
  Future<List<NotificationModell>> creatNots()async{
     final isar = await IsarServices().db;
    var tasks = isar.collection<TaskModel>();
    List<TaskModel> todaystask =await tasks
        .filter()
        .dateEqualTo(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)).findAll();

    List<NotificationModell> todaynots = [];
    todaystask.forEach((element) { 
      todaynots.add(NotificationModell(name: 'you have to start the task of : ${element.title}',date: element.begin));
      todaynots.add(NotificationModell(name: 'you should end the task of : ${element.title}',date: element.end));
    });

  return todaynots;
  }
  //this function will retern a bool 
  // the usage of this function is to deal with color of the notification
  //of course it will be static to call it easly
  // the function will compare if the notification has been sent or not
  static sendNotification(DateTime date){
    if(date.hour>DateTime.now().hour||(date.hour==DateTime.now().hour&&date.minute>=DateTime.now().minute)){
      return true;
    }
    else {
      return false;
    }
  }
 
}


