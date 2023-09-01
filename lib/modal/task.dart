import 'package:flutter/foundation.dart';

class Task extends ChangeNotifier{
 List<Task>? tasks;
    String? taskName;
  bool isDone;

  Task({this.taskName,this.isDone = false,this.tasks,});

  void toggleDoneTask () {
    isDone =! isDone;
    notifyListeners();
  }
  void addTask(Task listTask) {
    tasks!.add(listTask);
    notifyListeners();
  }

  void changeTask (String value,int index) {
    tasks![index].taskName = value;
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks!.remove(task);
    notifyListeners();
  }

}