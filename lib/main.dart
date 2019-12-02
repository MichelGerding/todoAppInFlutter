import 'package:flutter/material.dart';
//! home
import 'homepage.dart';
//! article
import 'mocks/mock_todo.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Container(
        child: Homepage(
          todos: MockTodo.FetchMany(),
        ),
      ),
    ),
  );
}
