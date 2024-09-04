import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_for_project_1/controllers/schedule_controller.dart';
import 'package:todo_list_for_project_1/models/employee.dart';
import 'package:todo_list_for_project_1/models/position.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';
import 'package:todo_list_for_project_1/models/schedule_status.dart';

class ScheduleEditPage extends StatefulWidget {
  final Schedule schedule;

  const ScheduleEditPage({super.key, required this.schedule});

  @override
  _ScheduleEditPageState createState() => _ScheduleEditPageState();
}

class _ScheduleEditPageState extends State<ScheduleEditPage> {
  final ScheduleController controller = Get.find<ScheduleController>();

  late TextEditingController titleController;
  late TextEditingController subTitleController;
  late TextEditingController descriptionController;
  late TextEditingController taskIdController;
  late ScheduleStatus selectedStatus;
  Employee? _selectedEmployee;
  DateTime? _selectedDate;

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

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.schedule.title);
    subTitleController =
        TextEditingController(text: widget.schedule.subTitle);
    descriptionController =
        TextEditingController(text: widget.schedule.description);
    taskIdController = TextEditingController(text: widget.schedule.taskId);
    selectedStatus = widget.schedule.status;
    _selectedEmployee = widget.schedule.responsiblePerson;
    _selectedDate = widget.schedule.dueDate;
  }

  @override
  void dispose() {
    titleController.dispose();
    subTitleController.dispose();
    descriptionController.dispose();
    taskIdController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? currentDate,
      firstDate: DateTime(currentDate.year - 10),
      lastDate: DateTime(currentDate.year + 10),
    );

    if (selectedDate != null && selectedDate != _selectedDate) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  void _updateSchedule() {
    Schedule updatedSchedule = Schedule(
      title: titleController.text,
      subTitle: subTitleController.text,
      responsiblePerson: _selectedEmployee,
      dueDate: _selectedDate,
      description: descriptionController.text,
      status: selectedStatus,
      taskId: taskIdController.text, createAt: DateTime.now(),
    );

    controller.updateSchedule(oldSchedule: widget.schedule, newSchedule: updatedSchedule);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _updateSchedule,
              child: const Text('수정 하기'),
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
                    controller: subTitleController,
                    decoration: const InputDecoration(
                      hintText: '비어 있음',
                      hintStyle: TextStyle(
                        color: Color(0xFFBDBDBD), // 연한 회색
                      ),
                      border: InputBorder.none,
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
                      border: InputBorder.none,
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
                    value: selectedStatus,
                    items: ScheduleStatus.values.map((status) {
                      return DropdownMenuItem<ScheduleStatus>(
                        value: status,
                        child: Text(status.toString().split('.').last),
                      );
                    }).toList(),
                    onChanged: (ScheduleStatus? newStatus) {
                      setState(() {
                        selectedStatus = newStatus!;
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
                    value: _selectedEmployee,
                    hint: Text('Select Employee'),
                    items: _employees.map((employee) {
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
                          ? "${_selectedDate!.toLocal()}".split(' ')[0] // YYYY-MM-DD 형식으로 표시
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