// tasks_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/task_controller.dart';
import 'package:todo_app/task_input_screen.dart';

class TasksScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do App'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return ListTile(
              leading: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => taskController.deleteTask(index),
              ),
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Text(
                '${task.dateTime.day}/${task.dateTime.month}/${task.dateTime.year} ${task.dateTime.hour}:${task.dateTime.minute}',
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TaskInputScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
