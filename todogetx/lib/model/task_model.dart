// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String id;
  String title;
  bool isCompleted;
  int categoryId;
  // DateTime dueDateTime;
  DateTime startDateTime;
  Duration notificationDuration;
  bool addToCalendar;
  // RepeatType repeatType;
  // TimeOfDay? repeatTime;
  int repeatValue; // Số tuần/tháng/năm lặp lại
  List<int> repeatDays; // Ngày lặp lại trong tuần
  int repeatMonthDay; // Ngày lặp lại trong tháng
  TaskModel({
    String? id,
    required this.title,
    this.isCompleted = false,
    this.categoryId = 0,
    // this.dueDateTime,
    DateTime? startDateTime,
    this.notificationDuration = const Duration(minutes: 5),
    this.addToCalendar = false,
    this.repeatValue = 1,
    this.repeatDays = const [],
    DateTime? repeatMonthDay,
    // List<SubTask> subTasks;
  })  : startDateTime = startDateTime ?? DateTime.now(),
        id = DateTime.timestamp().toString(),
        repeatMonthDay = DateTime.now().day;
}
