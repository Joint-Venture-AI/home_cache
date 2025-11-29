class AiModel {
  final int? id;
  final String userId;
  final String role;
  final String content;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String? deletedAt;

  AiModel({
    this.id,
    required this.userId,
    required this.role,
    required this.content,
    this.updatedAt,
    this.createdAt,
    this.deletedAt,
  });

  factory AiModel.fromJson(Map<String, dynamic> json) {
    return AiModel(
      id: json["id"],
      userId: json["user_id"] ?? '',
      role: json["role"] ?? '',
      content: json["content"] ?? '',
      updatedAt: json["updated_at"] != null
          ? DateTime.parse(json["updated_at"])
          : null,
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : null,
      deletedAt: json["deleted_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "role": role,
      "content": content,
      "updated_at": updatedAt?.toIso8601String(),
      "created_at": createdAt?.toIso8601String(),
      "deleted_at": deletedAt,
    };
  }
}

class ChatMessage {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});

  factory ChatMessage.fromAiModel(AiModel model) {
    return ChatMessage(
      text: model.content,
      isMe: model.role == 'user',
    );
  }
}
