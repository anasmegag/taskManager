import 'package:flutter/material.dart';
import 'package:mytasks/Helper/NotificationsServices.dart';
import 'package:mytasks/controller/UserControll.dart';
import 'package:mytasks/view/Pages/AddTask.dart';
import 'package:mytasks/view/Pages/AddUserP.dart';
import 'package:mytasks/view/Pages/FirstP.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mytasks/view/Pages/SetPages.dart';
import 'package:get/get.dart';
import 'package:mytasks/view/Pages/Setter.dart';



//this is the getx and isar Version
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationServices.initService();
  await NotificationServices.askPermision();
  await GetStorage.init();
 
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      getPages: [
        GetPage(name: "/SpS", page:()=>const FirstPage()),
        GetPage(name: "/inf", page:()=> AddUserPage()),
        GetPage(name: "/", page:()=>const  SetPages()),
        GetPage(name: "/a", page:()=> AddTask()),
        GetPage(name: "/ss", page:()=> Setter(), ),
      ],
     
      initialRoute:getroute()
    );
  }
}
String getroute(){
  if(UserControll.box.read('hasUser')==null){
    return '/SpS';
  }
  else if(UserControll.box.read('hasUser')==true){
    return '/';
  }
  else {
    return "/SpS";
  }
}