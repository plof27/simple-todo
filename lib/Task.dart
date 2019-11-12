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
    // i don't understand how any of this works
    _controller = TextEditingController(text: widget.taskData.taskText);

    _controller.addListener(() {
      final text = _controller.text;
      _controller.value = _controller.value.copyWith(
        text: text,
      );
      _updateTaskText(_controller.text);
    });

    super.initState();
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

  @override
  Widget build(BuildContext context) {
    if(widget.taskData.shouldFocus) {
      FocusScope.of(context).requestFocus();
    }

    return ListTile(
      title: TextField(
        autofocus: widget.taskData.shouldFocus,
        controller: _controller,
      ),
      onTap: _toggleCompletion,
      leading: Icon(
          widget.taskData.completed ? Icons.check_box : Icons.check_box_outline_blank
      ),
    );
  }
}