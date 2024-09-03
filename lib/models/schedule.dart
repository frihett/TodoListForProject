import 'package:todo_list_for_project_1/models/employee.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';

class Schedule {
  final String title;
  final Employee? responsiblePerson; // 담당자
  final String? subTitle;
  final String? description;
  final DateTime? dueDate;
  final ScheduleStatus status;
  final String taskId;

  Schedule({
    this.responsiblePerson,
    this.subTitle,
    this.description,
    this.dueDate,
    required this.title,
    required this.status,
    required this.taskId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Schedule &&
        other.title == title &&
        other.responsiblePerson == responsiblePerson &&
        other.subTitle == subTitle &&
        other.description == description &&
        other.dueDate == dueDate &&
        other.status == status &&
        other.taskId == taskId;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      responsiblePerson.hashCode ^
      subTitle.hashCode ^
      dueDate.hashCode ^
      status.hashCode ^
      taskId.hashCode ^
      description.hashCode;

  @override
  String toString() {
    return 'Schedule{title: $title, responsiblePerson: $responsiblePerson, detail: $subTitle, date: $dueDate, status: $status, taskId: $taskId, description: $description}';
  }

  Schedule copyWith({
    String? title,
    Employee? responsiblePerson,
    String? subTitle,
    DateTime? dueDate,
    ScheduleStatus? status,
    String? taskId,
    String? description,
  }) {
    return Schedule(
      title: title ?? this.title,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      subTitle: subTitle ?? this.subTitle,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      taskId: taskId ?? this.taskId,
      description: description ?? this.description,
    );
  }
}
