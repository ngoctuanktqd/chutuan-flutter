import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:todogetx/apps/untils/const.dart';
import 'package:todogetx/manager/controllers/tasks_controller.dart';

class TasksByCategory extends StatelessWidget {
  const TasksByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    // final catergoryController = Get.put(CategoryController());
    final tasksController = Get.put(TasksController());
    return Expanded(
      child: GroupedListView(
        shrinkWrap: true,
        elements: tasksController.listTask,
        groupBy: (element) => element.startDateTime,
        groupSeparatorBuilder: (DateTime groupByValue) => Text(
          DateFormat('dd-MM-yyyy').format(groupByValue),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        itemBuilder: (context, dynamic element) {
          print(element);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: element.isCompleted,
                    onChanged: (value) {
                      tasksController.changeIsCompleted(element.id, value);
                    },
                    shape: const CircleBorder(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          element.title,
                          style: const TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        getHeight(context, 0.01),
                        const Text(
                          'Culpa consectetur in velit mollit magna exercitation.',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        getHeight(context, 0.01),
                        Row(
                          children: [
                            Text(
                              DateFormat('Hms').format(element.startDateTime),
                              style: const TextStyle(
                                color: TuConstantColor.cancel,
                                fontSize: 12,
                              ),
                            ),
                            getWidth(context, 0.01),
                            const Icon(
                              Icons.notifications_rounded,
                              size: 14,
                            ),
                            getWidth(context, 0.01),
                            const Icon(
                              Icons.repeat_rounded,
                              size: 14,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.outlined_flag_rounded),
                  getWidth(context, 0.01),
                ],
              ),
            ),
          );
        },
        itemComparator: (item1, item2) =>
            item1.startDateTime.compareTo(item2.startDateTime), // optional
        useStickyGroupSeparators: false, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.DESC,
        sort: true,
      ),
    );
  }
}
