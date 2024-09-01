import 'package:flutter/material.dart';
import 'package:todo_list_for_project_1/widgets/schedule_item.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.brown),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('할일'),
          ),
          ScheduleItem(),
          ScheduleItem(),
        ],
      ),
    );
  }
}
