import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _TaskState extends State<Task> {
  bool _completed = false;

  void _toggleTaskState() {
    setState(() {
      _completed = !_completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        autofocus: true,
      ),
      onTap: _toggleTaskState,
      leading: Icon(
        _completed ? Icons.check_box : Icons.check_box_outline_blank,
      )
    );
  }
}

class Task extends StatefulWidget {
  Task({Key key, this.taskName}) : super(key: key);

  final String taskName;

  @override
  _TaskState createState() => _TaskState();
}