import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/components/customIconAppBarButton.dart';
import 'package:schedule_app/components/lineAtTheBeginingPage.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/ui/widgets/settings/sharedFeedback/classification.dart';
import 'package:schedule_app/ui/widgets/settings/sharedFeedback/comment.dart';
import 'package:schedule_app/ui/widgets/settings/sharedFeedback/contactType.dart';
import 'package:schedule_app/ui/widgets/settings/sharedFeedback/sendEmail.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ShareFeedback extends StatefulWidget {
  ShareFeedback({super.key});

  @override
  State<ShareFeedback> createState() => _ShareFeedbackState();
}

class _ShareFeedbackState extends State<ShareFeedback> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isKeyboardVisible = false;
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Add a listener to the focus node to detect changes in focus
    _focusNode.addListener(() {
      setState(() {
        isKeyboardVisible = _focusNode.hasFocus;
      });
    });
    // Add a listener to the text editing controller to detect changes in text
    controller.addListener(() {
      setState(() {
        isKeyboardVisible = controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //width: double.infinity,
        height: !isKeyboardVisible ? 600.h : 770.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              LineAtTheBeginingPage(),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "125".tr,
                      style: TextStyleFonts.BodyText.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    CustomAppBarButton(
                      icon: Icons.close,
                      press: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Text(
                '126'.tr,
                style: TextStyleFonts.Regular14.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CuntactType(
                    path: "assets/icons/linkiden.svg",
                    text: "58".tr,
                    press: () async {
                      final url =
                          "https://www.linkedin.com/company/ruknit/?viewAsMember=true";
                      launcher.launchUrl(await Uri.parse(url));
                    },
                  ),
                  CuntactType(
                    path: "assets/icons/twitter.svg",
                    text: "59".tr,
                    press: () async {
                      final url = "https://twitter.com/rukn_it";
                      launcher.launchUrl(await Uri.parse(url));
                    },
                  ),
                  CuntactType(
                    path: "assets/icons/insta.svg",
                    text: "57".tr,
                    press: () async {
                      final url = "https://www.instagram.com/rukn_it/";
                      launcher.launchUrl(await Uri.parse(url));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Divider(color: Theme.of(context).colorScheme.onPrimary),
              ClassificationFeedback(),
              Comment(controller: controller, focusNode: _focusNode),
              SizedBox(
                height: 32,
              ),
              CustomFloatingButtom(
                is_initializPage: true,
                text: "127".tr,
                press: () {
                  if (formKey.currentState!.validate()) {
                    print("validate");
                    sendEmail(
                        message: controller.text,
                        userProblem: settingsController
                            .classification[settingsController
                                .selectedCurrentClassificationRadioValue!]
                            .tr,
                        type_of_problem: '136'.tr,
                        new_message_from: '137'.tr,
                        hello_company: '138'.tr);
                    Get.back();

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('128'.tr),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      behavior: SnackBarBehavior.fixed,
                      action: SnackBarAction(
                        label: '129'.tr,
                        disabledTextColor: Colors.white,
                        textColor: Colors.yellow,
                        onPressed: () {},
                      ),
                    ));
                  } else {
                    print("unvalidate1");
                  }
                },
              )
            ],
          ),
        ));
  }
}

class CustomSnackBar {
  static void show(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue, // Customize background color
      colorText: Colors.white, // Customize text color
      snackPosition: SnackPosition.BOTTOM, // Adjust position if needed
      duration: Duration(seconds: 3), // Adjust duration as needed
    );
  }
}
