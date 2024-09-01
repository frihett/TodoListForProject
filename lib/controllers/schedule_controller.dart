import 'package:get/get.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';

class ScheduleController extends GetxController {
  final schedules = <Schedule>[].obs;

  //일정 생성
  void addSchedule(Schedule schedule) {
    schedules.add(schedule);
  }

  //일정 삭제
  void removeSchedule(Schedule schedule) {
    schedules.remove(schedule);
  }
}
