class Room {
  final String id;
  final String typeId;
  final String name;
  final String roomName;
  final String image;
  final List<ItemModel> items;

  Room({
    required this.id,
    required this.typeId,
    required this.name,
    required this.roomName,
    required this.image,
    required this.items,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] as String,
      typeId: json['type_id'] as String,
      name: json['name'] as String,
      roomName: json['room_name'] as String,
      image: json['image'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => ItemModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type_id': typeId,
      'name': name,
      'room_name': roomName,
      'image': image,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

class ItemModel {
  final String id;
  final String item;

  ItemModel({
    required this.id,
    required this.item,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as String,
      item: json['item'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item': item,
    };
  }
}
