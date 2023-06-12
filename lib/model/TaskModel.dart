import 'package:mytasks/model/Status.dart';

class TaskModel {
  int id;
  String title;
  String category;
  String discreption;
  DateTime begin;
  DateTime end;
  Status status;
  TaskModel({
    required this.id,
    required this.title,
    required this.category,
    required this.discreption,
    required this.begin,
    required this.end,
    required this.status,
  });
}
