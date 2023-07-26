class Task{
  final String task;
  bool isDone;

  Task({required this.task, this.isDone = false});

  void toggle(){
    isDone = !isDone;
  }

}