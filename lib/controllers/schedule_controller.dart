import 'package:get/get.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';
import 'package:todo_list_for_project_1/models/employee.dart';
import 'package:todo_list_for_project_1/models/position.dart';

class ScheduleController extends GetxController {
  final schedules = <Schedule>[].obs;

  // 일정 생성
  void addSchedule({required Schedule schedule}) {
    schedules.add(schedule);
  }

  // 일정 삭제
  void removeSchedule({required Schedule schedule}) {
    schedules.remove(schedule);
  }

  // 일정 수정
  void updateSchedule({required Schedule oldSchedule, required Schedule newSchedule}) {
    final index = schedules.indexOf(oldSchedule);
    if (index != -1) {
      schedules[index] = newSchedule;
    }
  }
}