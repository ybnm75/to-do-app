import 'package:flutter/material.dart';

class AddTasksScreen extends StatelessWidget {
  final void Function(String? value) toggleNewTaskTitle;

   const AddTasksScreen({Key? key, required this.toggleNewTaskTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            const Text(
              "Add a Task",
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 35),
            ),
             TextField(
               onChanged: (String value)  {
                 newTaskTitle = value;
               },
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 120)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent)),
              onPressed: ()  {
                toggleNewTaskTitle(newTaskTitle);
                },
              child: const Text(
                "Add Task",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
