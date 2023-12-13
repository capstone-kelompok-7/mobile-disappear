class LeaderboardModel {
  late final int id;
  final String? name;
  final String? photoProfile;
  final int? totalGram;
  final int? totalChallenge;
  final String? level;
  final int? exp;

  LeaderboardModel({
    required this.id,
    required this.name,
    required this.photoProfile,
    required this.totalGram,
    required this.totalChallenge,
    required this.level,
    required this.exp,
  });
}
