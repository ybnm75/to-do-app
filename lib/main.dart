import 'package:flutter/material.dart';
import 'package:to_do_app/modal/task.dart';
import 'package:to_do_app/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<Task>(
    create: (context) {
      return Task(
        tasks: [
          Task(taskName: "Buy Milk"),
          Task(taskName: "Buy bread"),
          Task(taskName: "Buy eggs"),
        ],
      );
    },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  TasksScreen(),
    );
  }
}

