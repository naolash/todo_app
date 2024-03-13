// task_controller.dart
import 'package:get/get.dart';
import 'package:todo_app/task_model.dart';
import 'package:todo_app/database_helper.dart';

class TaskController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    // Load tasks from the database when the controller is initialized
    loadTasks();
  }

  void addTask(Task task) async {
    int id = await databaseHelper.insertTask(task);
    task.id = id;
    tasks.add(task);
  }

  void loadTasks() async {
    tasks.assignAll(await databaseHelper.getTasks());
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }
}
