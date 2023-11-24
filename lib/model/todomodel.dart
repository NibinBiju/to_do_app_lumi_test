import 'package:hive/hive.dart';
part 'todomodel.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isDone;

  TodoModel({required this.name, this.isDone = false});
}
