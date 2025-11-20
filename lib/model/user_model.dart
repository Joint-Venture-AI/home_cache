class UserModel {
  final String email;
  final String password;
  final Profile profile;

  UserModel({
    required this.email,
    required this.password,
    required this.profile,
  });

  // Convert JSON to Model
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      profile: Profile.fromJson(json['profile'] ?? {}),
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'profile': profile.toJson(),
    };
  }
}

class Profile {
  final String firstName;
  final String lastName;

  Profile({
    required this.firstName,
    required this.lastName,
  });

  // Convert JSON to Model
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}
