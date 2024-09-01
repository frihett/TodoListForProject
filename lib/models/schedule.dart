import 'package:todo_list_for_project_1/models/employee.dart';

class Schedule {
  final String title;
  final Employee responsiblePerson; // 담당자
  final String detail;
  final DateTime date;

  Schedule({
    required this.title,
    required this.responsiblePerson,
    required this.detail,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Schedule &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          responsiblePerson == other.responsiblePerson &&
          detail == other.detail &&
          date == other.date;

  @override
  int get hashCode =>
      title.hashCode ^
      responsiblePerson.hashCode ^
      detail.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'Schedule{title: $title, responsiblePerson: $responsiblePerson, detail: $detail, date: $date}';
  }

  Schedule copyWith({
    String? title,
    Employee? responsiblePerson,
    String? detail,
    DateTime? date,
  }) {
    return Schedule(
      title: title ?? this.title,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      detail: detail ?? this.detail,
      date: date ?? this.date,
    );
  }
}
