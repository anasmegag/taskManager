import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/TaskModel.dart';

class IsarServices{
  late Future<Isar> db;

  Future<Isar>openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [TaskModelSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  IsarServices(){
    db=openDb();
  }
}