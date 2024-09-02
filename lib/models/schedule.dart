import 'package:todo_list_for_project_1/models/employee.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';

class Schedule {
  final String title;
  final Employee responsiblePerson; // 담당자
  final String subTitle;
  final String description;
  final DateTime date;
  final ScheduleStatus status;
  final String taskId;

  Schedule(
      {required this.title,
      required this.responsiblePerson,
      required this.subTitle,
      required this.date,
      required this.status,
      required this.taskId,
      required this.description });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Schedule &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          responsiblePerson == other.responsiblePerson &&
          subTitle == other.subTitle &&
          date == other.date &&
          status == other.status &&
          taskId == other.taskId &&
          description == other.description;

  @override
  int get hashCode =>
      title.hashCode ^
      responsiblePerson.hashCode ^
      subTitle.hashCode ^
      date.hashCode ^
      status.hashCode ^
      taskId.hashCode ^
      description.hashCode;

  @override
  String toString() {
    return 'Schedule{title: $title, responsiblePerson: $responsiblePerson, detail: $subTitle, date: $date, status: $status, taskId: $taskId, description: $description}';
  }

  Schedule copyWith({
    String? title,
    Employee? responsiblePerson,
    String? detail,
    DateTime? date,
    ScheduleStatus? status,
    String? taskId,
    String? description,
  }) {
    return Schedule(
      title: title ?? this.title,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      subTitle: detail ?? this.subTitle,
      date: date ?? this.date,
      status: status ?? this.status,
      taskId: taskId ?? this.taskId,
        description: description ?? this.description,
    );
  }
}
