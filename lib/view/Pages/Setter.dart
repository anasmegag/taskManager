import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/controller/TaskControll.dart';
import 'package:mytasks/view/Widgets/task.dart';

import '../../model/TaskModel.dart';

class Setter extends StatelessWidget {
  
  Setter({Key? key,}) : super(key: key);
  
  final Future<List<TaskModel>> tasks = Get.arguments;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Consts.backgroundColor,
      appBar: AppBar(
        backgroundColor: Consts.backgroundColor,
        title: Text(
          "Task",
          style: Consts.purpulTitle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: tasks,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                   itemBuilder: (context,i){
                    return Task(task: snapshot.data![i]);
                   },
                );
              }
              else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
