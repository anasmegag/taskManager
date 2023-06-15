import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mytasks/controller/TaskControll.dart';
class UserControll extends GetxController{
 static final box = GetStorage();
  TextEditingController userName = TextEditingController();
  String sex = "Male";
  String errorText = '';
  changeSex(String s){
    sex=s;
    update();
  }
  createUser(){
    if(userName.text==""){
      errorText = "entre a name";
      update();
    }
    else{
    box.write('name', userName.text);
    box.write("sex", sex);
    box.write("hasUser", true);
    TaskControll.idBox.write("id", 0);
    Get.offAllNamed("/");
    }
  }

  deleteUser(){
    box.erase();
    Get.offAllNamed("/SpS");
  }

}