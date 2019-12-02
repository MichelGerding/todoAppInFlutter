import '../models/todoModel.dart';

class MockTodo {
  static List<TodoModel> FetchMany() {
    return <TodoModel>[
      new TodoModel(
          title: "finish app", deadlineDate: DateTime.parse("2020-01-14")),
      new TodoModel(
          title: "finish app", deadlineDate: DateTime.parse("2020-01-14")),
      new TodoModel(
          title: "finish app", deadlineDate: DateTime.parse("2020-01-14")),
      new TodoModel(
          title: "finish app", deadlineDate: DateTime.parse("2020-01-14")),
      new TodoModel(
          title: "finish app", deadlineDate: DateTime.parse("2020-01-14")),
      new TodoModel(
          title: "finish app", deadlineDate: DateTime.parse("2020-01-14")),
    ];
  }
}
