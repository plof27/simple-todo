import 'package:flutter/cupertino.dart';
import 'package:simple_todo/Task.dart';
import 'package:flutter/material.dart';

class _TaskListState extends State<TaskList> {
  final _tasks = <String>[
    "Task 1",
    "Task 2",
  ];

  void _addTask() {
    setState(() {
      _tasks.add("This is a task");
    });
  }

  List<Widget> _buildTaskList() {
    return _tasks.map(
        (String taskString) => Task(taskName: taskString,)
    ).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    print(_tasks);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _buildTaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: "Add task",
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  TaskList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TaskListState createState() => _TaskListState();
}