class Task {
  final String title;
  final String date;
  final String status;

  Task({required this.title, required this.date, required this.status});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? 'upcoming',
    );
  }
}
