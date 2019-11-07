class TaskData{
//  String taskText;
  bool completed=false;

  bool shouldFocus;

  TaskData({this.shouldFocus});

  void toggleCompletion() {
    this.completed = !this.completed;
  }
}