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
      name: 'John Doe',
      email: 'john.doe@example.com',
      profileUrl: '',
      position: Position.developer,
    ),
    Employee(
      id: '2',
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      profileUrl: '',
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
