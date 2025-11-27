class RoomData {
  String id;
  String roomName;
  String name;
  String typeId;
  RoomType type;

  RoomData({
    required this.id,
    required this.roomName,
    required this.name,
    required this.typeId,
    required this.type,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) => RoomData(
        id: json['id'],
        roomName: json['room_name'],
        name: json['name'],
        typeId: json['type_id'],
        type: RoomType.fromJson(json['type']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'room_name': roomName,
        'name': name,
        'type_id': typeId,
        'type': type.toJson(),
      };
}

class RoomType {
  String image;
  String type;

  RoomType({
    required this.image,
    required this.type,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
        image: json['image'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'type': type,
      };
}
