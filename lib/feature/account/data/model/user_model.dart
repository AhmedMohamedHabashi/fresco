class UserModel {
  final String name;
  final String email;
  final String phone;
  final String address;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      address: data['address'] ?? '',
    );
  }
}
