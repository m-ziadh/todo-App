class Task{
  String title;
  bool isCheck;
  Task({required this.title, required this.isCheck});

  void toggleBox(bool value){
    isCheck = value;
  }
}