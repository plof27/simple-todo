import 'package:flutter/cupertino.dart';
import 'package:simple_todo/Task.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo/TaskData.dart';

class TaskList extends StatefulWidget {
  TaskList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final _tasks = <TaskData>[];

  void _addTask() {
    setState(() {
      // set all other tasks to not focus
      _tasks.forEach((taskData) {
        taskData.shouldFocus = false;
      });

      // reset the app focus so the next task will autofocus properly
      FocusScope.of(context).unfocus();

      // add new task at the end of the list and give it focus
      _tasks.add(TaskData(
        shouldFocus: true,
      ));
    });
  }

  Widget _buildTaskList() {
    return ListView.builder(
        itemBuilder: (context, i) {
          if (_tasks.length == 0 || i >= _tasks.length) return null;

          return Task(
            taskData: _tasks[i],
          );
        },
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () => (FocusScope.of(context).unfocus()),

        child: _buildTaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: "Add task",
        child: Icon(Icons.add),
      ),
    );
  }
}
