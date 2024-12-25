import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/ui/widgets/settings/sharedFeedback/shareFeedback.dart';
import 'package:schedule_app/ui/widgets/settings/customDivider.dart';
import 'package:schedule_app/ui/widgets/settings/customListTileWidget.dart';

class CuntactUs extends StatelessWidget {
  const CuntactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      //height: 2.h,
      // padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
          border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2))),
      child: Column(
        children: [
          CustomListTileWidget(
            text: "66".tr,
            press: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.0))),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return ShareFeedback();
                },
              );
              print("1");
            },
          ),
          CustomDivider(),
          CustomListTileWidget(
            text: "67".tr,
            press: () {
              print("2");
            },
          ),
          CustomDivider(),
          CustomListTileWidget(
            text: "68".tr,
            press: () {
              print("3");
            },
          ),
          CustomDivider(),
          CustomListTileWidget(
            text: "69".tr,
            press: () async {
              // signIn();
              await FirebaseMessaging.instance.subscribeToTopic('notify');
              print("4");
            },
          ),
        ],
      ),
    );
  }
}
