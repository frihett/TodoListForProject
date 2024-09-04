import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_for_project_1/models/schedule.dart';
import 'package:todo_list_for_project_1/pages/schedule_edit_page.dart';

class ScheduleItem extends StatefulWidget {
  final Schedule schedule;

  const ScheduleItem({super.key, required this.schedule});

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  final GlobalKey _key = GlobalKey();
  Size _widgetSize = Size.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 위젯이 빌드된 후 크기를 측정합니다.
      final RenderBox? renderBox =
          _key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          _widgetSize = renderBox.size;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<Schedule>(
      data: widget.schedule,
      feedback: Material(
        child: Container(
            width: _widgetSize.width,
            height: _widgetSize.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(widget.schedule.title),
                      Spacer(),
                      Icon(Icons.add),
                    ],
                  ),
                ),
                if (widget.schedule.subTitle != '')
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            widget.schedule.subTitle!,
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(widget.schedule.taskId),
                      Spacer(),
                      widget.schedule.responsiblePerson?.profileUrl != null
                          ? Image.network(
                        widget.schedule.responsiblePerson!.profileUrl!,
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      )
                          : Icon(Icons.person),
                    ],
                  ),
                ),
              ],
            )),
      ),
      child: GestureDetector(
        onTap: () {
          Get.dialog(Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: Container(
                width: 800,
                height: 800,
                child: ScheduleEditPage(
                  schedule: widget.schedule,
                )),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              key: _key, // GlobalKey 를 적용합니다.
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(widget.schedule.title),
                        Spacer(),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                  if (widget.schedule.subTitle != '')
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              widget.schedule.subTitle!,
                              style: TextStyle(
                                color: Colors.purple[800],
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(widget.schedule.taskId),
                        Spacer(),
                        widget.schedule.responsiblePerson?.profileUrl != null
                            ? Image.network(
                          widget.schedule.responsiblePerson!.profileUrl!,
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        )
                            : Icon(Icons.person),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
      childWhenDragging: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(widget.schedule.title),
                      Spacer(),
                      Icon(Icons.add),
                    ],
                  ),
                ),
                if (widget.schedule.subTitle != '')
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            widget.schedule.subTitle!,
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(widget.schedule.taskId),
                      Spacer(),
                      widget.schedule.responsiblePerson?.profileUrl != null
                          ? Image.network(
                        widget.schedule.responsiblePerson!.profileUrl!,
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      )
                          : Icon(Icons.person),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
