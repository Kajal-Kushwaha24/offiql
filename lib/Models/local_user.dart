import 'address_model.dart';

class LocalUserModel {
  final int? id;
  final String name;
  final String email;
  final String phone;

  LocalUserModel({
     this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory LocalUserModel.fromMap(Map<String, dynamic> map) {
    return LocalUserModel(
      id: map['id'],
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
     
    };
  }
}
