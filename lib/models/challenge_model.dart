class ChallengesModel {
  late final int id;
  final String? title;
  final String? photo;
  final String? startDate;
  final String endDate;
  final String? description;
  final String? status;
  final int? exp;

  ChallengesModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.status,
    required this.exp,
  });
}
