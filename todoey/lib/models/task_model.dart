class Task{
  final String taskTitle;
  bool isDone;

  Task({required this.taskTitle, this.isDone = false});

  void toggle(){
    isDone = !isDone;
  }

}