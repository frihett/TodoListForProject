import 'package:flutter/material.dart';
import 'package:todo_list_for_project_1/widgets/schedule_section.dart';

class ScheduleListPage extends StatelessWidget {
  const ScheduleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ScheduleSection(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ScheduleSection(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ScheduleSection(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ScheduleSection(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
