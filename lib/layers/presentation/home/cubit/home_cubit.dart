import 'package:dev_test/layers/data/task_model.dart';
import 'package:dev_test/layers/presentation/home/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  addTask(TaskModel task) {
    tasks.add(task);
    emit(AddTaskState());
  }

  changeDate(DateTime date) {
    selectedDate = date;
  }

  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
}
