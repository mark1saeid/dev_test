import 'package:flutter/material.dart';

class TaskModel {
  String taskName;
  TimeOfDay startDate;
  TimeOfDay endDate;
  Priority priorty;
  Category category;
  Color color;
  TaskModel(
      {required this.taskName,
      required this.startDate,
      required this.endDate,
      required this.priorty,
      required this.category,
      required this.color});
}

enum Category { work, personal }

enum Priority { low, medium, high }
