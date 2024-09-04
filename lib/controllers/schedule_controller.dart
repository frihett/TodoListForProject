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
  // 해당 섹션의 스케줄을 전체 리스트에서 지우고 다시 생성
  void updateSchedulesInSection({
    required String title,
    required List<Schedule> updatedSchedules,
  }) {
    // 기존 스케줄에서 해당 섹션의 스케줄을 제외하고 새로운 리스트를 생성합니다.
    final newSchedules = schedules.where((s) => s.status != ScheduleStatus.fromTitle(title: title)).toList();
    newSchedules.addAll(updatedSchedules);

    // 전체 스케줄 리스트를 업데이트합니다.
    schedules.assignAll(newSchedules);
  }


}