class UserRoomItemResponse {
  final bool success;
  final String message;
  final int statusCode;
  final List<UserRoomItem> data;

  UserRoomItemResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory UserRoomItemResponse.fromJson(Map<String, dynamic> json) {
    return UserRoomItemResponse(
      success: json['success'],
      message: json['message'],
      statusCode: json['status_code'],
      data: (json['data'] as List)
          .map((item) => UserRoomItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'status_code': statusCode,
        'data': data.map((item) => item.toJson()).toList(),
      };
}

class UserRoomItem {
  final String id;
  final String userRoomItemId;
  final String? image;
  final String? imageId;
  final Details details;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  UserRoomItem({
    required this.id,
    required this.userRoomItemId,
    this.image,
    this.imageId,
    required this.details,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory UserRoomItem.fromJson(Map<String, dynamic> json) {
    return UserRoomItem(
      id: json['id'],
      userRoomItemId: json['user_room_item_id'],
      image: json['image'],
      imageId: json['image_id'],
      details: Details.fromJson(json['details']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_room_item_id': userRoomItemId,
        'image': image,
        'image_id': imageId,
        'details': details.toJson(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'deleted_at': deletedAt?.toIso8601String(),
      };
}

class Details {
  final String type;
  final String brand;
  final String color;
  final String finish;
  final String location;
  final String brandLine;
  final String lastPainted;

  Details({
    required this.type,
    required this.brand,
    required this.color,
    required this.finish,
    required this.location,
    required this.brandLine,
    required this.lastPainted,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      type: json['type'],
      brand: json['brand'],
      color: json['color'],
      finish: json['finish'],
      location: json['location'],
      brandLine: json['brand_line'],
      lastPainted: json['last_painted'],
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'brand': brand,
        'color': color,
        'finish': finish,
        'location': location,
        'brand_line': brandLine,
        'last_painted': lastPainted,
      };
}
