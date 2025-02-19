class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Map<String, double> geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] ?? '',
      suite: map['suite'] ?? '',
      city: map['city'] ?? '',
      zipcode: map['zipcode'] ?? '',
      geo: {
        'lat': double.tryParse(map['geo']['lat'].toString()) ?? 0.0,
        'lng': double.tryParse(map['geo']['lng'].toString()) ?? 0.0,
      },
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': {
        'lat': geo['lat'],
        'lng': geo['lng'],
      },
    };
  }
}