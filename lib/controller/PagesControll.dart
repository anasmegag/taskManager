import 'package:get/get.dart';

class PagesControll extends GetxController{
  int index = 0;
  changePage(int i){
    index = i;
    update();
  }
}