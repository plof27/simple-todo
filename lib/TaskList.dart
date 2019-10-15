import 'package:flutter/cupertino.dart';
import 'package:simple_todo/Task.dart';
import 'package:flutter/material.dart';

class _TaskListState extends State<TaskList> {
  int _tasks = 0;

  void _addTask() {
    setState(() {
      _tasks += 1;
    });
  }

  List<Widget> _buildTaskList() {
    return <Widget>[
      for(var i=0; i < _tasks; i++) Task()
    ];
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () => (FocusScope.of(context).requestFocus(new FocusNode())),

        child: ListView(
          children: _buildTaskList(),
        ),
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