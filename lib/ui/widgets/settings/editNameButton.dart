import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/initalPage/validation.dart';

TextEditingController editUsername = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
Future<void> customShowCustomDialogToEditUserName(
    {required BuildContext context,
    required TextEditingController username}) async {
  editUsername.text = username.text;
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: formKey,
          child: AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            title: Text(
              "84".tr,
              style: TextStyleFonts.Bold18.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            content: TextFormField(
              controller: editUsername,
              validator: (val) => InitailPageValidation(val: val!),
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: "7".tr),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30.h,
                    width: 115.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "42".tr,
                        style: TextStyleFonts.CTAText.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                  Container(
                    height: 30.h,
                    width: 115.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary)),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          username.text = editUsername.text;
                          SettingServices.instance
                              .write(Keys.userName, username.text);
                          print("true");
                          Get.back();
                        } else {
                          print("false");
                        }
                      },
                      child: Text("85".tr,
                          style: TextStyleFonts.CTAText.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer)),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
