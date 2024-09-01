import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_for_project_1/controllers/schedule_controller.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';
import 'package:todo_list_for_project_1/widgets/schedule_section.dart';

class ScheduleListPage extends StatelessWidget {
  const ScheduleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScheduleController controller = Get.find<ScheduleController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScheduleSection(
                    title: '할 일',
                    schedule: controller.schedules
                        .where((s) => s.status == ScheduleStatus.todo)
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScheduleSection(
                    title: '급한 일',
                    schedule: controller.schedules
                        .where((s) => s.status == ScheduleStatus.urgent)
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScheduleSection(
                    title: '진행 중',
                    schedule: controller.schedules
                        .where((s) => s.status == ScheduleStatus.inProgress)
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScheduleSection(
                    title: '완료',
                    schedule: controller.schedules
                        .where((s) => s.status == ScheduleStatus.completed)
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
