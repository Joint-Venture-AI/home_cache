class DocumentsModel {
  final String id;
  final String title;
  final String subtitle;
  final String date;
  final String iconPath;
  final String category;
  final String? imagePath;
  final DateTime createdAt;
  final String? name;
  final String? brandName;
  final String? warrantyStartDate;
  final String? warrantyEndDate;
  final String? serialNumber;
  final String? servicesContact;

  DocumentsModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.iconPath,
    required this.category,
    this.imagePath,
    DateTime? createdAt,
    this.name,
    this.brandName,
    this.warrantyStartDate,
    this.warrantyEndDate,
    this.serialNumber,
    this.servicesContact,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "date": date,
      "iconPath": iconPath,
      "category": category,
      "imagePath": imagePath,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
