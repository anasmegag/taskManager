import 'package:isar/isar.dart';
import 'package:mytasks/model/Importance.dart';
import 'package:mytasks/model/Status.dart';
// import 'package:mytasks/model/Importance.dart';
// import 'package:mytasks/model/Status.dart';

part 'TaskModel.g.dart';

@collection
@Name("TaskModel")
class TaskModel {
  @Name("id")
  Id id=Isar.autoIncrement;
  @Name("title")
  String title;
  @Name("category")
  String category;
  @Name("description")
  String discreption;
  @Name("date")
  DateTime date;
  @Name("begin")
  DateTime begin;
  @Name("end")
  DateTime end;
  @Name("status")
  @Enumerated(EnumType.name)
  Status status;
  @Name("importance")
  @Enumerated(EnumType.name)
  Importance importance;
  TaskModel(
      {
      required this.title,
      required this.category,
      required this.discreption,
      required this.date,
      required this.begin,
      required this.end,
      required this.status,
      required this.importance});
}
