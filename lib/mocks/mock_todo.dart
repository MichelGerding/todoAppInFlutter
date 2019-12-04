import '../models/todoModel.dart';

class MockTodo {
  // ignore: non_constant_identifier_names
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
