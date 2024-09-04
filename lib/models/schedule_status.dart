enum ScheduleStatus {
  todo,              // 할 일
  urgent,            // 급한 일
  inProgress,        // 진행 중
  completed;         // 완료

  // 상태 이름을 기반으로 ScheduleStatus 반환
  static ScheduleStatus fromTitle({required String title}) {
    switch (title) {
      case '할 일':
        return ScheduleStatus.todo;
      case '급한 일':
        return ScheduleStatus.urgent;
      case '진행 중':
        return ScheduleStatus.inProgress;
      case '완료':
        return ScheduleStatus.completed;
      default:
        return ScheduleStatus.todo; // 기본값을 설정합니다.
    }
  }

  // ScheduleStatus를 String으로 변환
  String get title {
    switch (this) {
      case ScheduleStatus.todo:
        return '할 일';
      case ScheduleStatus.urgent:
        return '급한 일';
      case ScheduleStatus.inProgress:
        return '진행 중';
      case ScheduleStatus.completed:
        return '완료';
    }
  }
}