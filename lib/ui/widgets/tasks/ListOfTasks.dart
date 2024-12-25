import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/themeOfApp/colorConstants.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/task/taskDatabaseController.dart';
import 'package:schedule_app/data/database/configrationsDatabase.dart';
import 'package:schedule_app/data/models/taskModel.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/ui/widgets/tasks/initalPageOfTask.dart';
import 'package:schedule_app/ui/widgets/tasks/slider.dart';
import 'package:schedule_app/ui/widgets/tasks/taskDesign.dart';
import 'package:schedule_app/ui/widgets/tasks/taskNotification.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final controller = Get.find<TaskDatabaseController>();
  late bool missing;
  SQLite sq = SQLite();

  @override
  void initState() {
    super.initState();
    controller.fetchTasks();
    missing = false;
    //sq.MydeleteDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.w,
      ),
      child: Obx(
        () => Column(
          children: [
            controller.continueTasks.length != 0 ? CustomSilder() : Container(),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  controller.continueTasks.length == 0 &&
                          controller.missingTasks.length == 0
                      ? TaskInitPage()
                      : Container(),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: controller.missingTasks.length == 0
                            ? 96.h
                            : controller.continueTasks.length >= 7
                                ? 30
                                : 0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      //  itemCount: controller.tasks.length,
                      itemCount: controller.continueTasks.length,
                      //physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        Task task = controller.continueTasks[index];
                        notificationOfTask(task);
                        //   soon
                        //   notification(task); soon
                        return DesignOfTask(
                          taskName: task.title!,
                          color: colors[task.color == 7 ? 0 : task.color!],
                          check: task.isCompleted == 1 ? true : false,
                          onTapFun: () {
                            Get.toNamed(AppRoute.EditTask, arguments: task);
                            //controller.deleteTask(id: task.id!);
                          },
                          ckeckbox: () {
                            task = Task(
                                id: task.id,
                                title: task.title,
                                time: task.time,
                                notification: task.notification,
                                classification: task.classification,
                                color: task.color,
                                isCompleted: task.isCompleted == 1 ? 0 : 1);
                            controller.updateTask(task: task);
                          },
                          //   time: task.time!,
                        );
                      },
                    ),
                  ),
                  controller.missingTasks.length != 0
                      ? Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsetsDirectional.all(0),
                            childrenPadding: EdgeInsetsDirectional.zero,
                            title: Row(
                              children: [
                                //FaIcon(FontAwesomeIcons.angleDown),
                                Text('16'.tr,
                                    style: TextStyleFonts.Subtext.apply(
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                    )),
                                Icon(
                                  missing == false
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_drop_up,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            iconColor: Theme.of(context).colorScheme.background,
                            collapsedIconColor:
                                Theme.of(context).colorScheme.background,
                            initiallyExpanded: missing,
                            onExpansionChanged: (cc) {
                              setState(() {
                                missing = cc;
                              });
                            },
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                //  itemCount: controller.tasks.length,
                                itemCount: controller.missingTasks.length,
                                //physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  // Task task = controller.tasks[index];
                                  Task task = controller.missingTasks[index];
                                  return DesignOfTask(
                                    taskName: task.title!,
                                    color: Theme.of(context).hintColor,
                                    check: task.isCompleted == 1 ? true : false,
                                    onTapFun: () {
                                      Get.toNamed(AppRoute.EditTask,
                                          arguments: task);
                                      //controller.deleteTask(id: task.id!);
                                    },
                                    ckeckbox: () {
                                      task = Task(
                                          id: task.id,
                                          title: task.title,
                                          time: DateFormat('MMM d h:mm a')
                                              .format(DateTime.now()),
                                          notification: task.notification,
                                          classification: task.classification,
                                          color: task.color,
                                          isCompleted:
                                              task.isCompleted == 1 ? 0 : 1);
                                      controller.updateTask(task: task);
                                      print("object ... 1");
                                    },
                                    //  time: task.time!,
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            controller.tasks.length == 0
                ? CustomFloatingButtom(
                    text: "94".tr,
                    is_initializPage: true,
                    press: () {
                      Get.toNamed(AppRoute.AddTask);
                    },
                  )
                : Container(),
            controller.tasks.length == 0
                ? SizedBox(
                    height: 22.h,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

//  child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: List.generate(
//           3,
//           (index) => ListTile(
//             title: Text('Item $index'),
//           ),
//         ),
//       ),

