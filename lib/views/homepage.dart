import 'package:flutter/material.dart';
import 'package:to_do_app_lumi_test/controller/todo_controller.dart';
import 'package:to_do_app_lumi_test/controller/todo_hive_controller.dart';
import 'package:to_do_app_lumi_test/model/todomodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDone = false;
  TextEditingController textEditingController = TextEditingController();
  Todocontroller todocontroller = Todocontroller();
  TodoHiveController todoHiveController = TodoHiveController();

  @override
  void initState() {
    todoHiveController.getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 4, 102, 7),
        onPressed: () {
          bottomSheet();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: const Text('Todo app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              Todocontroller.todoList.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              Todocontroller.todoList[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Wrap(
                              children: [
                                Checkbox(
                                    value:
                                        Todocontroller.todoList[index].isDone,
                                    onChanged: (s) {
                                      Todocontroller.todoList[index].isDone =
                                          !Todocontroller
                                              .todoList[index].isDone;
                                      isDone =
                                          Todocontroller.todoList[index].isDone;
                                      setState(() {});
                                    }),
                                IconButton(
                                    onPressed: () {
                                      todocontroller.delete(index);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
              height: 350.0,
              color: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              todocontroller.addTodo(TodoModel(
                                  name: textEditingController.text,
                                  isDone: isDone));
                              setState(() {});
                            },
                            child: const Text('Add'))
                      ],
                    ),
                  )));
        });
  }
}
