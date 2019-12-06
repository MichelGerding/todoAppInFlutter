import 'package:flutter/material.dart';
import 'index.dart'; //! home
import 'mocks/mock_todo.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Container(
        child: Homepage(
          uid: 1,
        ),
      ),
    ),
  );
}
