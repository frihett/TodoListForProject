import 'package:get/get.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';

class ScheduleController extends GetxController {
  var schedules = <Schedule>[].obs;

  //일정 생성하기
  void addSchedule(Schedule schedule) {
    schedules.add(schedule);
  }

  //일정 삭제하기
  void removeSchedule(Schedule schedule) {
    schedules.remove(schedule);  // 일정 삭제
  }
}
