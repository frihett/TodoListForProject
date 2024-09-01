import 'package:todo_list_for_project_1/models/position.dart';

class Employee {
  final String id;
  final String name;
  final String email;
  final String profileUrl;
  final Position position;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.profileUrl,
    required this.position,
  });

  Employee copyWith({
    String? id,
    String? name,
    String? email,
    String? profileUrl,
    Position? position,
  }) {
    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
      position: position ?? this.position,
    );
  }

  @override
  String toString() {
    return 'Employee{id: $id, name: $name, email: $email, profileUrl: $profileUrl, position: $position}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          profileUrl == other.profileUrl &&
          position == other.position;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      profileUrl.hashCode ^
      position.hashCode;
}
