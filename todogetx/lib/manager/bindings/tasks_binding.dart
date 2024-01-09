import 'package:get/instance_manager.dart';
import 'package:todogetx/manager/controllers/tasks_controller.dart';

class TasksBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TasksController());
  }
}
