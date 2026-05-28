class UserModel {
  const UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

  final String id;
  final String email;
  final String name;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        email: json['email'] as String,
        name: json['name'] as String? ?? '',
      );
}
