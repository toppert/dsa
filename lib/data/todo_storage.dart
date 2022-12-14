import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'model/todo_model.dart';

final TodoStorage todoStorage = FileSystemTodoStorage();

abstract class TodoStorage {
  Future<List<Todo>> readTodoList();

  Future<List<Todo>> readTodoListFilterDay(String dataFilter);

  Future<void> insertTodo(Todo todo);
}

class FileSystemTodoStorage extends TodoStorage {
  @override
  Future<List<Todo>> readTodoList() async {
    try {
      final file = await _localFile;
      final content = await file.readAsString();
      final List<dynamic> jsonArray = jsonDecode(content);
      return jsonArray
          .map(
            (jsonObject) => Todo.fromJson(jsonObject),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/todoList.json');
  }

  @override
  Future<void> insertTodo(Todo todo) async {
    final latestTodoList = await readTodoList();
    latestTodoList.add(todo);
    try {
      final file = await _localFile;
      final jsonArray = latestTodoList.map((todo) => todo.toJson()).toList();
      await file.writeAsString(jsonEncode(jsonArray));
      if (kDebugMode) {
        print("Add new ${todo.title}");
      }
    } catch (e) {
      return;
    }
  }

  @override
  Future<List<Todo>> readTodoListFilterDay(String dataFilter) async {
    try {
      final file = await _localFile;
      final content = await file.readAsString();
      final List<dynamic> jsonArray = jsonDecode(content);
      return jsonArray
          .map(
            (jsonObject) => Todo.fromJson(jsonObject),
          )
          .toList()
          .where((element) => element.day == dataFilter)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
