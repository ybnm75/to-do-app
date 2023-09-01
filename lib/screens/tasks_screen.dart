import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/modal/task.dart';
import 'package:to_do_app/screens/add_task_screen.dart';
import 'package:to_do_app/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child:    AddTasksScreen(toggleNewTaskTitle: (String? newTaskValue) {
                          Provider
                              .of<Task>(context, listen: false)
                              .addTask(Task(taskName: newTaskValue!));

                        Navigator.pop(context);
                      },
                        ),
                    ),
                  ));
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding:
              const EdgeInsets.only(top: 120, left: 30, right: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  color: Colors.lightBlueAccent,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "ToDoeall",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Lexend'),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "${Provider.of<Task>(context).tasks!.length} Tasks",
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Lexend', fontSize: 18),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: TasksList(),
          ),
        ),
      ]),
    );
  }
}
