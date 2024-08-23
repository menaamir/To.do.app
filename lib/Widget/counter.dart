import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int calculateCompletedTask;
  final int allTasks;

  const Counter(
      {Key? key, required this.calculateCompletedTask, required this.allTasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text(
        "$calculateCompletedTask/$allTasks",
        style: TextStyle(
          fontSize: 44,
          color: calculateCompletedTask == allTasks ? Color.fromARGB(255, 142, 253, 200) : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// This widget is the root of your application.
