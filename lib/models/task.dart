import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  bool isDone = false;

  Task({required this.name, required this.isDone});
  void toggleDone() {
    isDone = !isDone;
  }
}
