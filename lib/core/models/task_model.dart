class TaskModel {
  final String id;
  final String taskname;
  final String description;
  final bool isdone;

  TaskModel({
    required this.id,
    required this.taskname,
    required this.description,
    required this.isdone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? '',
      taskname: json['taskname'] ?? '',
      description: json['description'] ?? '',
      isdone: json['isdone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskname': taskname,
      'description': description,
      'isdone': isdone,
    };
  }
}