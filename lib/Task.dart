import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo/TaskData.dart';

class Task extends StatefulWidget {
  Task({Key key, this.taskData}) : super(key: key);

  final TaskData taskData;

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {

  void _toggleCompletion() {
    setState(() {
      widget.taskData.toggleCompletion();
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.taskData.shouldFocus) {
      FocusScope.of(context).requestFocus();
    }

    return ListTile(
      title: TextField(
        autofocus: widget.taskData.shouldFocus,
        onSubmitted: widget.taskData.setText,
        controller: TextEditingController(text: widget.taskData.taskText),
      ),
      onTap: _toggleCompletion,
      leading: Icon(
          widget.taskData.completed ? Icons.check_box : Icons.check_box_outline_blank
      ),
    );
  }
}