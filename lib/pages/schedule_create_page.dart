import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_for_project_1/controllers/schedule_controller.dart';
import 'package:todo_list_for_project_1/models/employee.dart';
import 'package:todo_list_for_project_1/models/position.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';

class ScheduleCreatePage extends StatefulWidget {
  const ScheduleCreatePage({super.key});

  @override
  _ScheduleCreatePageState createState() => _ScheduleCreatePageState();
}

class _ScheduleCreatePageState extends State<ScheduleCreatePage> {
  final ScheduleController controller = Get.find<ScheduleController>();
  Employee? _selectedEmployee;

  final List<Employee> _employees = [
    Employee(
        id: '1',
        name: 'John Doe',
        email: 'john.doe@example.com',
        profileUrl: '',
        position: Position.developer),
    Employee(
        id: '2',
        name: 'Jane Smith',
        email: 'jane.smith@example.com',
        profileUrl: '',
        position: Position.manager),
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('추가하기'),
            ),
            const SizedBox(height: 16.0),
            Container(
              child: TextField(
                controller: titleController,
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
                    controller: subtitleController,
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
                    child: DropdownButton<Employee>(
                        isExpanded: true, // 전체 너비 사용
                        value: _selectedEmployee,
                        items: _employees.map((Employee employee) {
                          return DropdownMenuItem<Employee>(
                            value: employee,
                            child: Text(employee.name),
                          );
                        }).toList(),
                        onChanged: (Employee? newValue) {
                          setState(() {
                            _selectedEmployee = newValue;
                          });
                        })),
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
                    controller: deadlineController,
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
                controller: descriptionController,

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
