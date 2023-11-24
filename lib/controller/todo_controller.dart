import 'package:to_do_app_lumi_test/controller/todo_hive_controller.dart';
import 'package:to_do_app_lumi_test/model/todomodel.dart';

class Todocontroller {
  TodoHiveController todoHiveController = TodoHiveController();
  static List<TodoModel> todoList = [];

  void addTodo(TodoModel todoModel) {
    todoList.add(todoModel);
    todoHiveController.addDatatohive(todoList);
  }
}
