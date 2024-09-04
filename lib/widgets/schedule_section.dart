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
