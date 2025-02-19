import 'address_model.dart';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Map<String, String> company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      address: Address.fromMap(map['address'] ?? {}),
      phone: map['phone'] ?? '',
      website: map['website'] ?? '',
      company: {
        'name': map['company']['name'] ?? '',
        'catchPhrase': map['company']['catchPhrase'] ?? '',
        'bs': map['company']['bs'] ?? '',
      },
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toMap(),
      'phone': phone,
      'website': website,
      'company': {
        'name': company['name'],
        'catchPhrase': company['catchPhrase'],
        'bs': company['bs'],
      },
    };
  }
}
