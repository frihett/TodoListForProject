import 'package:flutter/material.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;

  const ScheduleItem({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(schedule.title),
                  Spacer(),
                  Icon(Icons.add),
                ],
              ),
              Row(
                children: [
                  Text(schedule.detail),
                ],
              ),
              Row(
                children: [
                  Text(schedule.taskId),
                  Spacer(),
                  Icon(Icons.circle),
                ],
              ),
            ],
          )),
    );
  }
}
