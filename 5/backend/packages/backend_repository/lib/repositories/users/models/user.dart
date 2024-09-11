// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  const User({
    required this.id,
    required this.name,
    required this.surname,
    required this.lastname,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
  });

  final int id;
  final String name;
  final String surname;
  final String lastname;
  final String email;
  final int age;
  final double height;
  final double weight;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'surname': surname,
      'lastname': lastname,
      'email': email,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      surname: map['surname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
      height: (map['height'] as num).toDouble(),
      weight: (map['weight'] as num).toDouble(),
    );
  }
}
