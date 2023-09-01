import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/modal/task.dart';
import 'package:to_do_app/widgets/toDoList.dart';

class TasksList extends StatefulWidget {

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Task>(
      builder: (context,taskData,child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return  ToDoList(
              taskName: taskData.tasks![index].taskName!,
              toggleCheckBox: (checkBoxState) {
                setState(() {
                  Provider.of<Task>(context,listen: false).tasks![index].toggleDoneTask();
                });
              }, isChecked: taskData.tasks![index].isDone,
              toggleModifyName: (String? newTaskName) {
                  taskData.changeTask(newTaskName!,index);
                },
              toggleDeleteTask: () {
                taskData.deleteTask(taskData.tasks![index]);
              },
            );
          },
          itemCount: taskData.tasks!.length,
        );
      },
    );
  }
}
