import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app_lumi_test/controller/todo_controller.dart';
import 'package:to_do_app_lumi_test/model/todomodel.dart';

class TodoHiveController {
  var box = Hive.box('db');

  getdata() async {
    List demoList = await box.get('DB');
    Todocontroller.todoList =
        demoList.map((e) => TodoModel(name: e.name, isDone: e.isDone)).toList();
  }

  addDatatohive(List todolist) async {
    await box.put('DB', todolist);
  }
}
