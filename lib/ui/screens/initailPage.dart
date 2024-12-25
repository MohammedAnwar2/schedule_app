// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customTextFormField.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/datasource/onBoarding.dart';
import 'package:schedule_app/ui/widgets/initalPage/customButtom.dart';
import 'package:schedule_app/ui/widgets/initalPage/validation.dart';

// ignore: must_be_immutable
class InitailPage extends StatelessWidget {
  InitailPage({super.key});

  TextEditingController textController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool showButton = MediaQuery.of(context).viewInsets.bottom != 0;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          body: SafeArea(
        child: Container(
          margin: EdgeInsetsDirectional.only(start: 24.w, end: 24.h),
          width: double.infinity,
          child: Form(
            key: keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(
                  flex: 4,
                ),
                SvgPicture.asset(
                  SettingServices.instance.read(Keys.language) == "ar"
                      ? OnBoardingListArabic[4].image!
                      : OnBoardingListEnglish[4].image!,
                  width: 245.w,
                  height: 245.h,
                ),
                Spacer(),
                Text(
                  '7'.tr,
                  style: TextStyleFonts.OnboardingText.apply(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '8'.tr,
                  style: TextStyleFonts.BodyText.apply(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.5)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextForm(
                    controller: textController,
                    validation: (val) => InitailPageValidation(val: val!)),
                Spacer(
                  flex: 3,
                ),
                Visibility(
                  visible: !showButton,
                  child: Align(
                      alignment: Alignment.center,
                      child: CustomButtom(
                          textController: textController, keyForm: keyForm)),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
