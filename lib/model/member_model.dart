class MemberModel {
  final String id;
  final String email;
  final Profile profile;

  MemberModel({
    required this.id,
    required this.email,
    required this.profile,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      email: json['email'],
      profile: Profile.fromJson(json['profile']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'profile': profile.toJson(),
    };
  }
}

class Profile {
  final String image;
  final String firstName;
  final String lastName;

  Profile({
    required this.image,
    required this.firstName,
    required this.lastName,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      image: json['image'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}
