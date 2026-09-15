import 'package:flutter_todolist/core/models/task_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class InitialTaskCreationState extends HomeState {}

class LoadingTaskCreationState extends HomeState {}

class SuccessCreationTaskState extends HomeState {
  final TaskModel tasks;
  SuccessCreationTaskState({required this.tasks});
}

class FailedToCreateTaskState extends HomeState {
  final String errorMessage;

  FailedToCreateTaskState({required this.errorMessage});
}

class InitialTaskGettingState extends HomeState {}

class LoadingTaskGettingState extends HomeState {}

class SuccessGettingTaskState extends HomeState {
  final List<TaskModel> tasks;

  SuccessGettingTaskState({required this.tasks});
}

class FailedToGetTaskState extends HomeState {
  final String message;

  FailedToGetTaskState({required this.message});
}

class InitialTaskdeleteState extends HomeState {}

class LoadingTaskdeleteState extends HomeState {}

class SuccessdeleteTaskState extends HomeState {}

class FailedTodeleteTaskState extends HomeState {
  final String message;

  FailedTodeleteTaskState({required this.message});
}


class InitialTaskUpdateState extends HomeState {}

class LoadingTaskUpdateState extends HomeState {}

class SuccessTaskUpdateState extends HomeState {}

class FailedTaskUpdateState extends HomeState {
  final String message;

  FailedTaskUpdateState({
    required this.message,
  });
}
