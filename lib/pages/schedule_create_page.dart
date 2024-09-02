import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_for_project_1/controllers/schedule_controller.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';
import 'package:todo_list_for_project_1/models/employee.dart';

class ScheduleCreatePage extends StatefulWidget {
  const ScheduleCreatePage({super.key});

  @override
  _ScheduleCreatePageState createState() => _ScheduleCreatePageState();
}

class _ScheduleCreatePageState extends State<ScheduleCreatePage> {
  final ScheduleController controller = Get.find<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextField(
                decoration: const InputDecoration(
                    hintText: '제목',
                    hintStyle: TextStyle(
                      color: Color(0xFFBDBDBD), // 연한 회색
                    ),
                    border: InputBorder.none),
                style: TextStyle(fontSize: 24.0),
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Container(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(Icons.subtitles, color: Color(0xFF757575)),
                        SizedBox(width: 4),
                        Text('부제목', style: TextStyle(color: Color(0xFF757575))),
                      ],
                    )),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: '비어 있음',
                      hintStyle: TextStyle(
                        color: Color(0xFFBDBDBD), // 연한 회색
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Container(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Color(0xFF757575)),
                        SizedBox(width: 4),
                        Text('담당자', style: TextStyle(color: Color(0xFF757575))),
                      ],
                    )),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '비어 있음',
                      hintStyle: TextStyle(
                        color: Color(0xFFBDBDBD), // 연한 회색
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          // 직원 선택 기능을 나중에 추가할 수 있습니다.
                        },
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Container(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, color: Color(0xFF757575)),
                        SizedBox(width: 4),
                        Text('마감일', style: TextStyle(color: Color(0xFF757575))),
                      ],
                    )),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '비어 있음',
                      hintStyle: TextStyle(
                        color: Color(0xFFBDBDBD), // 연한 회색
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '비어 있음',
                  hintStyle: TextStyle(
                    color: Color(0xFFBDBDBD), // 연한 회색
                  ),
                  border: InputBorder.none,
                ),
                maxLines: null, // 여러 줄 입력 허용
              ),
            ),
          ],
        ),
      ),
    );
  }
}
