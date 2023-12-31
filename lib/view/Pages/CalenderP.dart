import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasks/Helper/Consts.dart';
import 'package:mytasks/controller/CalendarControll.dart';

import '../Widgets/task.dart';
// import 'package:mytasks/model/Status.dart';
// import 'package:mytasks/model/TaskModel.dart';

// import '../Widgets/task.dart';


class CalenderPage extends StatelessWidget {
 CalenderPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:15,right: 10,top: 10),
      child: GetBuilder<CalendarControll>(
        init: CalendarControll(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "Today’s task",
                style: Consts.purpulsubTitle,
              ),
              const SizedBox(height: 15,),
              DatePicker(
                
                DateTime.utc(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day - 3),
                initialSelectedDate: DateTime.now(),
                
                height: 80,
                
                width: 56,
                selectionColor: Consts.mainColor,
                selectedTextColor: Consts.backgroundColor,
                onDateChange: (date) {
                  // New date selected
                  {
                    controller.changeDate(date);
                  }
                },
              ),
              const SizedBox(height: 15,),
              const Divider(
                height: 2,
                color: Consts.mainColor,
                thickness: 2,
                indent: 15,
                endIndent: 15,
              ),
               Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FutureBuilder(
                    future: controller.showTasksonDate(),
                    builder: (context,snapshot) {
                      if(snapshot.hasData){
                        return SizedBox(
                          height: 490,
                          
                child: ListView.builder(
                        
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_,i){
                          return Task(task: snapshot.data![i]);
                        },
                      ));
                      }
                      else{
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                  )
                ),
              


            ],
          );
        }
      ),
    );
  }
}
