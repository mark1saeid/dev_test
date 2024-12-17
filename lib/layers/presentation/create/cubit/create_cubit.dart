import 'package:dev_test/layers/data/task_model.dart';
import 'package:dev_test/layers/presentation/create/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCubit extends Cubit<CreateState> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  String taskName = "";
  Priority priority = Priority.low;
  Category category = Category.work;
  Color color = Colors.blue[100]!;

  changeTaskName(String name) {
    taskName = name;
    emit(AddDataState());
  }

  changeStartTime(TimeOfDay time) {
    startTime = time;
    emit(AddDataState());
  }

  changeEndTime(TimeOfDay time) {
    endTime = time;
    emit(AddDataState());
  }

  changePriority(Priority value) {
    priority = value;
    emit(AddDataState());
  }

  changeCategory(Category value, Color colorValue) {
    category = value;
    color = colorValue;
    emit(AddDataState());
  }

  reset() {
    startTime = TimeOfDay.now();
    endTime = TimeOfDay.now();
    taskName = "";
    priority = Priority.low;
    category = Category.work;
    emit(ResetDataState());
  }

  CreateCubit() : super(CreateInitialState());
  static CreateCubit get(context) => BlocProvider.of(context);
}
