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
  TextEditingController _controller;

  void initState() {
    _controller = TextEditingController(text: widget.taskData.taskText);
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCompletion() {
    setState(() {
      widget.taskData.toggleCompletion();
    });
  }

  void _updateTaskText(String newText) {
    setState(() {
      widget.taskData.setText(newText);
    });
  }

  void _updateTaskFocus(bool newFocus) {
    setState(() {
      widget.taskData.shouldFocus = newFocus;
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
        controller: _controller,
        onChanged: (newText) {
          _updateTaskFocus(false);
          _updateTaskText(newText);
        },
        style: TextStyle(
          fontSize: 17
        ),
        decoration: InputDecoration(
          border: InputBorder.none
        ),
//        decoration: null,
      ),
      onTap: _toggleCompletion,
      leading: Icon(
          widget.taskData.completed ? Icons.check_box : Icons.check_box_outline_blank
      ),
    );
  }
}