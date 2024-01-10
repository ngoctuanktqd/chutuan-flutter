import 'package:get/get.dart';
import 'package:todogetx/apps/router/router_name.dart';
import 'package:todogetx/model/task_model.dart';

class TasksController extends GetxController {
  List<TaskModel> listTask = <TaskModel>[
    TaskModel(title: '1', startDateTime: DateTime(2024, 1, 3, 17, 30)),
    TaskModel(title: '2', startDateTime: DateTime(2024, 1, 3, 17, 30)),
    TaskModel(title: '3', startDateTime: DateTime(2024, 1, 3, 17, 30)),
    TaskModel(title: '4', startDateTime: DateTime(2024, 1, 4, 17, 30)),
    TaskModel(title: '5', startDateTime: DateTime(2024, 1, 4, 17, 30)),
    TaskModel(title: '6', startDateTime: DateTime(2024, 1, 4, 17, 30)),
    TaskModel(title: '7', startDateTime: DateTime(2024, 1, 5, 17, 30)),
    TaskModel(title: '8', startDateTime: DateTime(2024, 1, 5, 17, 30)),
    TaskModel(title: '9', startDateTime: DateTime(2024, 1, 5, 17, 30)),
    TaskModel(title: '10', startDateTime: DateTime(2024, 1, 6, 17, 30)),
    TaskModel(title: '11', startDateTime: DateTime(2024, 1, 6, 17, 30)),
    TaskModel(title: '12', startDateTime: DateTime(2024, 1, 6, 17, 30)),
    TaskModel(title: '13', startDateTime: DateTime(2024, 1, 6, 17, 30)),
    TaskModel(title: '14', startDateTime: DateTime(2024, 1, 7, 17, 30)),
    TaskModel(title: '15', startDateTime: DateTime(2024, 1, 7, 17, 30)),
    TaskModel(title: '16', startDateTime: DateTime(2024, 1, 8, 17, 30)),
    TaskModel(title: '17', startDateTime: DateTime(2024, 1, 8, 17, 30)),
    TaskModel(title: '18', startDateTime: DateTime(2024, 1, 8, 17, 30)),
  ].obs;

  List<TaskModel> listTaskByCategory = <TaskModel>[].obs;

  List<TaskModel> getTaskByCategory() {
    return listTaskByCategory;
  }

  changeIsCompleted(id, isCompleted) {
    int index = listTask.indexWhere((element) => element.id == id);
    if (index != -1) {
      listTask[index].isCompleted = isCompleted;
    }
  }

  goToCategories() {
    Get.toNamed(RouterName.categories);
  }
}
