class SingUpCollectedData {
  String userId;
  String homeType;
  String homeAddress;
  List<String> homePowerType;
  List<String> homeWaterSupplyType;
  List<String> homeHeatingType;
  String homeHeatingPower;
  List<String> homeCoolingType;
  List<String> responsibleFor;
  List<String> wantToTrack;
  LastServiceData lastServiceData;

  SingUpCollectedData({
    required this.userId,
    required this.homeType,
    required this.homeAddress,
    required this.homePowerType,
    required this.homeWaterSupplyType,
    required this.homeHeatingType,
    required this.homeHeatingPower,
    required this.homeCoolingType,
    required this.responsibleFor,
    required this.wantToTrack,
    required this.lastServiceData,
  });

  factory SingUpCollectedData.fromJson(Map<String, dynamic> json) {
    return SingUpCollectedData(
      userId: json['user_id'],
      homeType: json['home_type'],
      homeAddress: json['home_address'],
      homePowerType: List<String>.from(json['home_power_type']),
      homeWaterSupplyType: List<String>.from(json['home_water_supply_type']),
      homeHeatingType: List<String>.from(json['home_heating_type']),
      homeHeatingPower: json['home_heating_power'],
      homeCoolingType: List<String>.from(json['home_cooling_type']),
      responsibleFor: List<String>.from(json['responsible_for']),
      wantToTrack: List<String>.from(json['want_to_track']),
      lastServiceData: LastServiceData.fromJson(json['last_service_data']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'home_type': homeType,
      'home_address': homeAddress,
      'home_power_type': homePowerType,
      'home_water_supply_type': homeWaterSupplyType,
      'home_heating_type': homeHeatingType,
      'home_heating_power': homeHeatingPower,
      'home_cooling_type': homeCoolingType,
      'responsible_for': responsibleFor,
      'want_to_track': wantToTrack,
      'last_service_data': lastServiceData.toMap(),
    };
  }
}

class LastServiceData {
  String type;
  String lastService;
  String note;

  LastServiceData({
    required this.type,
    required this.lastService,
    required this.note,
  });

  factory LastServiceData.fromJson(Map<String, dynamic> json) {
    return LastServiceData(
      type: json['type'],
      lastService: json['lastservice'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'lastservice': lastService,
      'note': note,
    };
  }
}
