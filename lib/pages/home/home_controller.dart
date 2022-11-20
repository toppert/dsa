import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolistplus/data/model/todo_model.dart';
import 'package:todolistplus/data/todo_storage.dart';
import 'package:todolistplus/utils/constant.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  var titleController = TextEditingController().obs;
  var descriptionController = TextEditingController().obs;
  var dateTimeNow = DateTime.now();
  var eventDateTime = DateTime.now().obs;
  var eventTimeStart = TimeOfDay.now().obs;
  var eventTimeEnd = TimeOfDay.now().obs;
  late Future<List<Todo>> myTodo;
  var selectDay = DateTime.now().obs;

  @override
  Future<void> onInit() async {
    selectDay.value = dateTimeNow;
    myTodo = getNoteByDay()!;
  }

  eventAddValueSelect(DateTime? date) {
    selectDay.value = date!;
    getNoteByDay();
    if (kDebugMode) {
      print("value selectDay");
    }
    update();
  }

  Future<void> addTodo() async {
    String date = convertToString(eventDateTime.value);
    final todo = Todo(
        title: titleController.value.text,
        description: descriptionController.value.text,
        day: date);
    await todoStorage.insertTodo(todo);
    getNoteByDay();
    if (kDebugMode) {
      print("getNoteByDay add Todo");
    }
    update();
  }

  String _getRandomTitle() {
    final r = Random();
    return String.fromCharCodes(
      List.generate(
        50,
        (index) => r.nextInt(33) + 89,
      ),
    );
  }

  TimeOfDay? setTime({TimeOfDay? time, TimeOfDay? result}) {
    time = result;
    update();
    return time;
  }

  Future<List<Todo>>? getAllNote() async {
    myTodo = todoStorage.readTodoList();
    return myTodo;
  }

  Future<List<Todo>>? getNoteByDay() async {
    myTodo =
        todoStorage.readTodoListFilterDay(convertToString(selectDay.value));
    if (kDebugMode) {
      print("getNoteByDay");
    }
    update();
    return myTodo;
  }
}
