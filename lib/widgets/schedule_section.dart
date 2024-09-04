import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_for_project_1/controllers/schedule_controller.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';
import 'package:todo_list_for_project_1/widgets/schedule_item.dart';

class ScheduleSection extends StatelessWidget {
  final String title;
  final List<Schedule> schedule;
  final Color color;

  ScheduleSection({
    super.key,
    required this.title,
    required this.schedule,
    required this.color,
  });

  final ScheduleController controller = Get.find<ScheduleController>();

  // 드래그가 떨어진 위치에 해당하는 인덱스를 반환하는 함수
  int _getTargetIndex(double offsetY) {

    final itemHeight = 100.0; // 각 아이템의 예상 높이
    if (schedule.isEmpty) {
      return 0; // 기본 인덱스 반환
    }
    final index = (offsetY / itemHeight).floor();
    return index.clamp(0, schedule.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Schedule>(
      onAcceptWithDetails: (details) {
        final receivedSchedule = details.data;


        // 섹션 제목에 맞게 스케줄 상태를 업데이트합니다.
        final updatedSchedule = receivedSchedule.copyWith(
          status: ScheduleStatus.fromTitle(title: title),
        );

        // 기존의 스케줄을 업데이트 된 스케줄로 교체합니다.
        controller.updateSchedule(
          oldSchedule: receivedSchedule,
          newSchedule: updatedSchedule,
        );

        final oldIndex = schedule.indexOf(receivedSchedule);
        final newIndex = _getTargetIndex(details.offset.dy);

        // 유효한 인덱스인지 확인
        if (oldIndex == -1) {
          // 올바른 인덱스가 아닐 경우 처리
          return;
        }

        if (oldIndex != newIndex) {
          // 새로운 순서로 업데이트
          final updatedSchedules = List<Schedule>.from(schedule);
          updatedSchedules.removeAt(oldIndex);
          updatedSchedules.insert(newIndex, receivedSchedule);


          // 컨트롤러에 업데이트된 리스트를 전달
          controller.updateSchedulesInSection(title: title, updatedSchedules: updatedSchedules);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$title  ${schedule.length}'),
              ),
              Column(
                children: schedule
                    .map((schedule) => ScheduleItem(schedule: schedule))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
