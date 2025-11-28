class Task {
  String id;
  String title;
  String description;
  DateTime initialDate;
  DateTime? date;
  bool isLinked;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.initialDate,
    this.date,
    this.isLinked = false,
  });

  // From JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      initialDate: DateTime.parse(json['initial_date']),
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'initial_date': initialDate.toIso8601String(),
      'date': date?.toIso8601String(),
    };
  }
}
