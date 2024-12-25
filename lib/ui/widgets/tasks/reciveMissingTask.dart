// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:schedule_app/core/controller/task/taskDatabaseController.dart';
// import 'package:schedule_app/data/models/taskModel.dart';
// import 'package:schedule_app/ui/screens/add_edit_tasks_screens/editTasks.dart';
// import 'package:schedule_app/ui/widgets/tasks/taskDesign.dart';

// class ReceiveMissingTask extends StatelessWidget {
//   ReceiveMissingTask({
//     super.key,
//     required this.controller,
//   });

//   final TaskDatabaseController controller;
//   final controller1 = Get.find<TaskDatabaseController>();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.zero,
//           //  itemCount: controller.tasks.length,
//           itemCount: controller1.missingTasks.length,
//           //physics: const BouncingScrollPhysics(),
//           itemBuilder: (BuildContext context, int index) {
//             // Task task = controller.tasks[index];
//             Task task = controller1.missingTasks[index];
//             return DesignOfTask(
//               taskName: task.title!,
//               color: Theme.of(context).hintColor,
//               check: task.isCompleted == 1 ? true : false,
//               onTapFun: () {
//                 Get.to(() => EditTask(
//                       task: task,
//                     ));
//                 //controller.deleteTask(id: task.id!);
//               },
//               ckeckbox: () {
//                 task = Task(
//                     id: task.id,
//                     title: task.title,
//                     time: DateFormat('MMM d, h:mm a').format(DateTime.now()),
//                     notification: task.notification,
//                     classification: task.classification,
//                     color: task.color,
//                     isCompleted: task.isCompleted == 1 ? 0 : 1);
//                 controller1.updateTask(task: task);
//                 print("object ... 1");
//               },
//               //  time: task.time!,
//             );
//           },
//         ));
//   }
// }
