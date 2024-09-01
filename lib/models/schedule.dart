import 'package:todo_list_for_project_1/models/employee.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';

class Schedule {
  final String title;
  final Employee responsiblePerson; // 담당자
  final String detail;
  final DateTime date;
  final ScheduleStatus status;
  final String taskId;

  Schedule(
      {required this.title,
      required this.responsiblePerson,
      required this.detail,
      required this.date,
      required this.status,
      required this.taskId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Schedule &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          responsiblePerson == other.responsiblePerson &&
          detail == other.detail &&
          date == other.date &&
          status == other.status &&
          taskId == other.taskId;

  @override
  int get hashCode =>
      title.hashCode ^
      responsiblePerson.hashCode ^
      detail.hashCode ^
      date.hashCode ^
      status.hashCode ^
      taskId.hashCode;

  @override
  String toString() {
    return 'Schedule{title: $title, responsiblePerson: $responsiblePerson, detail: $detail, date: $date, status: $status, taskId: $taskId}';
  }

  Schedule copyWith({
    String? title,
    Employee? responsiblePerson,
    String? detail,
    DateTime? date,
    ScheduleStatus? status,
    String? taskId,
  }) {
    return Schedule(
      title: title ?? this.title,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      detail: detail ?? this.detail,
      date: date ?? this.date,
      status: status ?? this.status,
      taskId: taskId ?? this.taskId,
    );
  }
}
