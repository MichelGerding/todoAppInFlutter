class TodoModel {
  final String title;
  final DateTime deadlineDate;
  String date;
  final int postId;
  bool completed;

  TodoModel(
      {this.title, this.deadlineDate, this.postId = 0, completed = false}) {
    this.date =
        "${this.deadlineDate.day}-${this.deadlineDate.month}-${this.deadlineDate.year}";
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json['title'],
        postId: json['postId'],
        deadlineDate: DateTime.parse(json['deadline']),
        completed: json['completed']);
  }

  String toJson() {
    return '{"title": "${this.title}", "date": "${this.date}", "completed": "${this.completed}"}';
  }
}
