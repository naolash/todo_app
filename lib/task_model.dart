// task_model.dart
class Task {
  int? id;
  String title;
  String description;
  DateTime dateTime;

  Task(
      {this.id,
      required this.title,
      required this.description,
      required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(), // Convert DateTime to string
    };
  }
}
