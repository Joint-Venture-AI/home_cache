import 'dart:convert';

class Room {
  final String id;
  final String typeId;
  final String name;
  final String roomName;
  final String? image;
  final List<Item> items;
  

  Room({
    required this.id,
    required this.typeId,
    required this.name,
    required this.roomName,
    this.image,
    required this.items,
  });

// Factory to parse JSON response
  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json['id'] as String,
        typeId: json['type_id'] as String,
        name: json['name'] as String,
        roomName: json['room_name'] as String,
        image: json['image'] as String?,
        items: (json['items'] as List<dynamic>)
            .map((item) => Item.fromJson(item))
            .toList(),
      );

// Convert to JSON (for sending requests or saving)
  Map<String, dynamic> toJson() => {
        'id': id,
        'type_id': typeId,
        'name': name,
        'room_name': roomName,
        'image': image,
        'items': items.map((e) => e.toJson()).toList(),
      };
}

// Item model
class Item {
  final String id;
  final String item;
  final String? userItemId; 

  Item({
    required this.id,
    required this.item,
    this.userItemId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as String,
        item: json['item'] as String,
        userItemId: json['user_item_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'item': item,
        if (userItemId != null) 'user_item_id': userItemId,
      };
}

// Optional: Create room request helper
class CreateRoomRequest {
  final String typeId;
  final String name;
  final List<String> itemIds;

  CreateRoomRequest({
    required this.typeId,
    required this.name,
    required this.itemIds,
  });

  Map<String, dynamic> toJson() => {
        'type_id': typeId,
        'name': name,
        'items': itemIds,
      };

  String toJsonString() => json.encode(toJson());
}
