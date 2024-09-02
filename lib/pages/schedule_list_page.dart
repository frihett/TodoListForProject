import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_for_project_1/controllers/schedule_controller.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';
import 'package:todo_list_for_project_1/pages/schedule_create_page.dart';
import 'package:todo_list_for_project_1/widgets/schedule_section.dart';

class ScheduleListPage extends StatelessWidget {
  const ScheduleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScheduleController controller = Get.find<ScheduleController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => ScheduleCreatePage());
                  },
                  child: const Text('일정 생성하기'),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ScheduleSection(
                          title: '할 일',
                          schedule: controller.schedules
                              .where((s) => s.status == ScheduleStatus.todo)
                              .toList(),
                          color: Colors.blue.withOpacity(0.05),
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
                          color: Colors.red.withOpacity(0.05),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ScheduleSection(
                          title: '진행 중',
                          schedule: controller.schedules
                              .where(
                                  (s) => s.status == ScheduleStatus.inProgress)
                              .toList(),
                          color: Colors.orange.withOpacity(0.05),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ScheduleSection(
                          title: '완료',
                          schedule: controller.schedules
                              .where(
                                  (s) => s.status == ScheduleStatus.completed)
                              .toList(),
                          color: Colors.green.withOpacity(0.05),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
