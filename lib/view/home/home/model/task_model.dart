class Task {
  String id;
  String createdBy;
  String title;
  String description;
  String initialDate;
  String recurrenceType;
  String? updatedAt;
  String createdAt;
  String? deletedAt;

  Task({
    required this.id,
    required this.createdBy,
    required this.title,
    required this.description,
    required this.initialDate,
    required this.recurrenceType,
    this.updatedAt,
    required this.createdAt,
    this.deletedAt,
  });

  // From JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      createdBy: json['created_by'],
      title: json['title'],
      description: json['description'],
      initialDate: json['initial_date'],
      recurrenceType: json['recurrence_type'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      deletedAt: json['deleted_at'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_by': createdBy,
      'title': title,
      'description': description,
      'initial_date': initialDate,
      'recurrence_type': recurrenceType,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'deleted_at': deletedAt,
    };
  }
}