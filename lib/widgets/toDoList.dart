import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


class ToDoList extends StatefulWidget {
  final String taskName;
  final bool isChecked;
  final void Function(String? value) toggleModifyName;
  final void Function(bool? value) toggleCheckBox;
  final void Function () toggleDeleteTask;

  const ToDoList({
    Key? key,
    required this.taskName,
    required this.toggleCheckBox,
    required this.isChecked, required this.toggleModifyName, required this.toggleDeleteTask,
  }) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: widget.toggleDeleteTask,
      title: Text(
        widget.taskName,
        style: widget.isChecked ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: widget.isChecked,
        onChanged: widget.toggleCheckBox,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.mode,
          color: Colors.lightBlueAccent,
        ),
        onPressed: () {
           AwesomeDialog(
            context: context,
            dialogType: DialogType.info, // You can change this to other types as needed
            animType: AnimType.scale,
            title: 'Modify the Task',
            body: Column(
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: widget.toggleModifyName,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.toggleModifyName(widget.taskName);
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Modify"),
                ),
              ],
            ),
          ).show();
        },
      ),
    );
  }
}
