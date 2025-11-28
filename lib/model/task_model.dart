class TaskModel {
  final String id;
  final String createdBy;
  final String title;
  final String description;
  final String initialDate;
  final String recurrenceType;
  final String? lastServiceBy;
  final String? presentAssignTo;

  TaskModel({
    required this.id,
    required this.createdBy,
    required this.title,
    required this.description,
    required this.initialDate,
    required this.recurrenceType,
    this.lastServiceBy,
    this.presentAssignTo,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    final taskData = json['task_data'] ?? {};
    return TaskModel(
      id: taskData['id'] ?? '',
      createdBy: taskData['created_by'] ?? '',
      title: taskData['title'] ?? '',
      description: taskData['description'] ?? '',
      initialDate: taskData['initial_date'] ?? '',
      recurrenceType: taskData['recurrence_type'] ?? '',
      lastServiceBy: json['last_service_by']?.toString(),
      presentAssignTo: json['present_assign_to']?.toString(),
    );
  }
}
