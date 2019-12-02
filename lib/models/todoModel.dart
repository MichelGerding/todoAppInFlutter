import '../functions.dart';

class TodoModel {
  final String title;
  final DateTime deadlineDate;
  String date;
  TodoModel({this.title, this.deadlineDate}) {
    this.date =
        "${this.deadlineDate.day}-${this.deadlineDate.month}-${this.deadlineDate.year}";
  }
}
