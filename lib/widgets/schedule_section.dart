import 'package:flutter/material.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';
import 'package:todo_list_for_project_1/widgets/schedule_item.dart';

class ScheduleSection extends StatelessWidget {
  final String title;
  final List<Schedule> schedule;

  const ScheduleSection(
      {super.key, required this.title, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          // 여러 개의 ScheduleItem을 생성 스프레드 연산자 사용
          ...schedule
              .map((schedule) => ScheduleItem(schedule: schedule))
              .toList(),
        ],
      ),
    );
  }
}
