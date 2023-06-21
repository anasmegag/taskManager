import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class UserControll extends GetxController{
 static final box = GetStorage();
  TextEditingController userName = TextEditingController();
  TextEditingController age = TextEditingController();
 
  String errorText = '';
  
  createUser(){
    if(userName.text==""||age.text==''){
      errorText = "entre a name or age";
      update();
    }
    else{
    box.write('name', userName.text);
    box.write("age", int.parse(age.text));
    box.write("hasUser", true);
   // TaskControll.idBox.write("id", 0);
    Get.offAllNamed("/");
    }
  }

  deleteUser(){
    box.erase();
    Get.offAllNamed("/SpS");
  }

}