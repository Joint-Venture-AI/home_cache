class NotificationModel {
  final String title;
  final String description;
  final bool isOverdue;

  NotificationModel({
    required this.title,
    required this.description,
    this.isOverdue = false,
  });
}
