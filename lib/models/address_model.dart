class Address {
  final int id;
  final int userId;
  final String acceptedName;
  final String phone;
  final String address;
  final bool isPrimary;

  Address({
    required this.id,
    required this.userId,
    required this.acceptedName,
    required this.phone,
    required this.address,
    required this.isPrimary,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      acceptedName: json['accepted_name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      isPrimary: json['is_primary'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'accepted_name': acceptedName,
      'phone': phone,
      'address': address,
      'is_primary': isPrimary,
    };
  }

  Address copyWith({
    int? id,
    int? userId,
    String? acceptedName,
    String? phone,
    String? address,
    bool? isPrimary,
  }) {
    return Address(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      acceptedName: acceptedName ?? this.acceptedName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }
}
