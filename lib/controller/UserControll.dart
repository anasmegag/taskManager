import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytasks/Helper/NotificationsServices.dart';
import 'package:mytasks/controller/TaskControll.dart';
import 'package:path_provider/path_provider.dart';
class UserControll extends GetxController{
 static final box = GetStorage();
  TextEditingController userName = TextEditingController();
  TextEditingController age = TextEditingController();
 
  String errorText = '';
  bool toUpdate = false;
  //function for creating user
  createUser(){
    if(userName.text==""||age.text==''){
      errorText = "entre a name or age";
      update();
    }
    else{
    box.write('name', userName.text);
    box.write("age", int.parse(age.text));
    box.write("hasUser", true);
   NotificationServices.dailyNotification();
    Get.offAllNamed("/");
    }
  }
  //function for deleting user
  deleteUser(){
    TaskControll.clearall();
    box.erase();
    Get.offAllNamed("/SpS");
  }
  //this part used to deal with the image
  File ?image;
  chosePicture(ImageSource source)async{
    final imagee = await ImagePicker().pickImage(source: source);
    if (imagee==null){return;}
    final finalImage =await saveImage(imagee.path);
    image = finalImage;
    update();
  }
  //this function will save the image
  Future saveImage(String imagepath)async{
    final path = await getApplicationDocumentsDirectory();
    final name = basename(imagepath);
    final image = File('${path.path}/$name');
    box.write('pic',image.path);
    return File(imagepath).copy(image.path);
  }

}