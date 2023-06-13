import 'package:flutter/material.dart';
import 'package:mytasks/controller/UserControll.dart';
import 'package:mytasks/view/Pages/AddTask.dart';
import 'package:mytasks/view/Pages/AddUserP.dart';
import 'package:mytasks/view/Pages/FirstP.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mytasks/view/Pages/SetPages.dart';
import 'package:get/get.dart';
//import 'package:mytasks/view/Pages/FirstP.dart';


//this is the getx Version 
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      
      getPages: [
        GetPage(name: "/SpS", page:()=> FirstPage()),
        GetPage(name: "/inf", page:()=> AddUserPage()),
        GetPage(name: "/", page:()=>  SetPages()),
        GetPage(name: "/a", page:()=> AddTask()),
      ],

      
      initialRoute:UserControll.box.read('hasUser')?'/': "/SpS",
    );
  }
}