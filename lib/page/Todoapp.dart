import 'package:flutter/material.dart';
import 'package:untitled/Widget/counter.dart';

import '../Widget/todo-card.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  List allTasks = [
    Task(title: "Publish video", status: true),
    Task(title: "Laugh louder", status: true),
    Task(title: "GEM", status: true),
    Task(title: "Learn", status: true),
  ];

  delete( int clickedTask) {
    setState(() {
      allTasks.remove(allTasks[clickedTask]);
    });
  }

  chageStatus(int indexTask) {
    setState(() {
      allTasks[indexTask].status = !allTasks[indexTask].status;
    });
  }

  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  clearList(){
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  final myController = TextEditingController();

  int calculateCompletedTask() {
    int compltedTasks = 0;

    for (var item in allTasks) {
      if (item.status) {
        compltedTasks++;
      }
    }

    return compltedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 20,
                        decoration: InputDecoration(
                          hintText: "Add new Task",
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                        onPressed: () {
                          addnewtask();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              clearList();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 37,
            color: Color.fromARGB(255, 255, 188, 214),
          )
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
                allTasks: allTasks.length,
                calculateCompletedTask: calculateCompletedTask()),
            Container(
              margin: EdgeInsets.only(top: 22),
              height: 550,
              color: Color.fromARGB(255, 55, 63, 82),
              child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return todocard(
                      vartitle: allTasks[index].title,
                      daneOrnot: allTasks[index].status,
                      chageStatus: chageStatus,
                      index: index,
                      delete: delete,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
