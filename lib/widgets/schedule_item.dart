import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(8.0),),
          child: Column(
            children: [
              Row(
                children: [
                  Text('상담 견적서 발행1'),
                  Spacer(),
                  Icon(Icons.add),
                ],
              ),
              Row(
                children: [
                  Text('상담'),
                ],
              ),
              Row(
                children: [
                  Text('CRM-199'),
                  Spacer(),
                  Icon(Icons.circle),
                ],
              ),
            ],
          )),
    );
  }
}
