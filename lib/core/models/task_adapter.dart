import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskAdapter {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TaskModel> addTask(TaskModel task) async {
    final doc = _firestore.collection('tasks').doc();

    await doc.set({
      'id': doc.id,
      'taskname': task.taskname,
      'description': task.description,
      'isdone': task.isdone,
    });

    return TaskModel(
      id: doc.id,
      taskname: task.taskname,
      description: task.description,
      isdone: task.isdone,
    );
  }

  Future<List<TaskModel>> getTasks() async {
    final tasks = await _firestore.collection('tasks').get();

    return tasks.docs.map((doc) => TaskModel.fromJson(doc.data())).toList();
  }

  Future<void> deletetask({required String id}) async {
    await _firestore.collection('tasks').doc(id).delete();
  }

  Future<void> updateTask({
    required String id,
    required String taskname,
    required String description,
    required bool isdone,
  }) async {
    await _firestore.collection('tasks').doc(id).update({
      'taskname': taskname,
      'description': description,
      'isdone': isdone,
    });
  }
}
