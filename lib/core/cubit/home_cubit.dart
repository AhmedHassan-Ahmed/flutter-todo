import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/core/models/task_adapter.dart';
import 'package:flutter_todolist/core/models/task_model.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TaskAdapter taskAdapter;

  HomeCubit({required this.taskAdapter}) : super(HomeInitialState());

  Future<void> addTask({
    required String taskname,
    required String description,
  }) async {
    emit(LoadingTaskCreationState());

    try {
      final task = TaskModel(
        id: '',
        taskname: taskname,
        description: description,
        isdone: false
      );

      final createdTask = await taskAdapter.addTask(task);

      emit(SuccessCreationTaskState(tasks: createdTask));
    } catch (e) {
      emit(FailedToCreateTaskState(errorMessage: e.toString()));
    }
  }

  Future<void> getTasks() async {
    emit(LoadingTaskGettingState());

    try {
      final tasks = await taskAdapter.getTasks();

      emit(SuccessGettingTaskState(tasks: tasks));
    } catch (e) {
      emit(FailedToGetTaskState(message: e.toString()));
    }
  }

  Future<void> deleTask({required String id}) async {
    emit(LoadingTaskdeleteState());

    try {
      await taskAdapter.deletetask(id: id);

      emit(SuccessdeleteTaskState());
    } catch (e) {
      emit(FailedTodeleteTaskState(message: e.toString()));
    }
  }

  Future<void> updateTask({
    required String id,
    required String taskname,
    required String description,
    required bool isdone,
  }) async {
    emit(LoadingTaskUpdateState());

    try {
      await taskAdapter.updateTask(
        id: id,
        taskname: taskname,
        description: description,
        isdone: isdone,
      );

      emit(SuccessTaskUpdateState());

      await getTasks();
    } catch (e) {
      emit(FailedTaskUpdateState(message: e.toString()));
    }
  }
}
