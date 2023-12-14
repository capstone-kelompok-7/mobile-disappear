class Profile {
  final int id;
  final String email;
  final String name;
  final String phone;
  final String photoProfile;
  final int totalGram;
  final int totalChallenge;
  final String level;
  final List<String> preference;

  Profile({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.photoProfile,
    required this.totalGram,
    required this.totalChallenge,
    required this.level,
    required this.preference,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['data']['id'],
      email: json['data']['email'],
      name: json['data']['name'],
      phone: json['data']['phone'],
      photoProfile: json['data']['photo_profile'],
      totalGram: json['data']['total_gram'],
      totalChallenge: json['data']['total_challenge'],
      level: json['data']['level'],
      preference: List<String>.from(json['data']['preference']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'photoProfile': photoProfile,
      'totalGram': totalGram,
      'totalChallenge': totalChallenge,
      'level': level,
      'preference': preference,
    };
  }
}
