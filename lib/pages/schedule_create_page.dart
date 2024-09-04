import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_for_project_1/controllers/schedule_controller.dart';
import 'package:todo_list_for_project_1/models/employee.dart';
import 'package:todo_list_for_project_1/models/position.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';

class ScheduleCreatePage extends StatefulWidget {
  const ScheduleCreatePage({super.key});

  @override
  _ScheduleCreatePageState createState() => _ScheduleCreatePageState();
}

class _ScheduleCreatePageState extends State<ScheduleCreatePage> {
  final ScheduleController controller = Get.find<ScheduleController>();
  Employee? _selectedEmployee;
  DateTime? _selectedDate;
  ScheduleStatus _selectedStatus = ScheduleStatus.todo;

  final List<Employee> _employees = [
    Employee(
      id: '1',
      name: '신승찬',
      email: 'john.doe@example.com',
      profileUrl: 'data:image/webp;base64,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',
      position: Position.developer,
    ),
    Employee(
      id: '2',
      name: '홍길동',
      email: 'jane.smith@example.com',
      profileUrl: 'data:image/jpeg;base64,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',
      position: Position.manager,
    ),
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController taskIdController = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(currentDate.year - 10),
      lastDate: DateTime(currentDate.year + 10),
    );

    if (selectedDate != null && selectedDate != _selectedDate) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  void _createSchedule() {
    // 입력값을 통해 Schedule 객체 생성
    Schedule newSchedule = Schedule(
      title: titleController.text,
      subTitle: subtitleController.text,
      responsiblePerson: _selectedEmployee,
      dueDate: _selectedDate,
      description: descriptionController.text,
      status: _selectedStatus,
      taskId: taskIdController.text, createAt: DateTime.now(),
    );

    // 생성된 Schedule 객체를 ScheduleController에 전달
    controller.addSchedule(schedule: newSchedule);

    // 데이터 저장 후 페이지 이동
    Get.back(); // 페이지를 뒤로 이동
  }

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
              onPressed: () {
                _createSchedule();
              },
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
                  border: InputBorder.none,
                ),
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
                  ),
                ),
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
                      Icon(Icons.subtitles, color: Color(0xFF757575)),
                      SizedBox(width: 4),
                      Text('업무 코드', style: TextStyle(color: Color(0xFF757575))),
                    ],
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: taskIdController,
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
                      Icon(Icons.check_circle, color: Color(0xFF757575)),
                      SizedBox(width: 4),
                      Text('상태', style: TextStyle(color: Color(0xFF757575))),
                    ],
                  ),
                ),
                Expanded(
                  child: DropdownButton<ScheduleStatus>(
                    isExpanded: true,
                    value: _selectedStatus,
                    items: ScheduleStatus.values.map((ScheduleStatus status) {
                      return DropdownMenuItem<ScheduleStatus>(
                        value: status,
                        child: Text(status
                            .toString()
                            .split('.')
                            .last), // ScheduleStatus 이름만 표시
                      );
                    }).toList(),
                    onChanged: (ScheduleStatus? newStatus) {
                      setState(() {
                        _selectedStatus = newStatus!;
                      });
                    },
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
                  ),
                ),
                Expanded(
                  child: DropdownButton<Employee>(
                    isExpanded: true,
                    // 전체 너비 사용
                    value: _selectedEmployee,
                    hint: Text('Select Employee'),
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
                    },
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
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _selectDate,
                    child: Text(
                      _selectedDate != null
                          ? "${_selectedDate!.toLocal()}"
                              .split(' ')[0] // YYYY-MM-DD 형식으로 표시
                          : '비어 있음',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF757575),
                      ),
                    ),
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
