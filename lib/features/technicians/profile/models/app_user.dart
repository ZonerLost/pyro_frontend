class TAppUser {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String avatarUrl;

  const TAppUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatarUrl,
  });

  TAppUser copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? address,
    String? avatarUrl,
  }) {
    return TAppUser(
      id: id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
