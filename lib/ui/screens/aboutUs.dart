import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customListTile.dart';
import 'package:schedule_app/components/customSimpleAppBar.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class AbouteUs extends StatelessWidget {
  const AbouteUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimplAppBar(
            press: () {
              Get.back();
            },
            text: "47".tr,
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("48".tr,
                    style: TextStyleFonts.HeadingText.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)),
                Text("49".tr,
                    style: TextStyleFonts.BodyText.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.7))),
                SizedBox(
                  height: 16.h,
                ),
                Text("50".tr,
                    style: TextStyleFonts.HeadingText.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)),
                SizedBox(
                  height: 4.h,
                ),
                Text("51".tr,
                    style: TextStyleFonts.BodyText.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.7))),
                SizedBox(
                  height: 4.h,
                ),
                Text("52".tr,
                    style: TextStyleFonts.BodyText.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.7))),
                SizedBox(
                  height: 4.h,
                ),
                Text("53".tr,
                    style: TextStyleFonts.BodyText.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.7))),
                SizedBox(
                  height: 4.h,
                ),
                Text("54".tr,
                    style: TextStyleFonts.BodyText.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.7))),
                SizedBox(
                  height: 4.h,
                ),
                Text("55".tr,
                    style: TextStyleFonts.BodyText.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.7))),
                SizedBox(
                  height: 8.h,
                ),
                Text("56".tr,
                    style: TextStyleFonts.HeadingText.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () {
                    launcher.launchUrl(Uri.parse("https://www.ruknit.com/"),
                        mode:
                            launcher.LaunchMode.externalNonBrowserApplication);
                  },
                  child: CustomListTile(
                    firstWidget: SvgPicture.asset("assets/icons/rukin.svg",
                        width: 20.w, height: 20.h),
                    space: 4,
                    secondWidget: Text("ruknit.com",
                        style: TextStyleFonts.Regular14.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7))),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () async {
                    launcher.launchUrl(
                      await Uri.parse(
                          "mailto:ruknit.info@gmail.com?subject=Flutter Url Lanucher&body=Hi , Flutter developer"),
                    );
                  },
                  child: CustomListTile(
                    firstWidget: SvgPicture.asset("assets/icons/info.svg",
                        width: 20.w, height: 20.h),
                    space: 4,
                    secondWidget: Text("info@ruknit.com",
                        style: TextStyleFonts.Regular14.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7))),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () async {
                    final url = "https://www.instagram.com/rukn_it/";
                    launcher.launchUrl(await Uri.parse(url));
                  },
                  child: CustomListTile(
                    firstWidget: SvgPicture.asset("assets/icons/insta.svg",
                        width: 20.w, height: 20.h),
                    space: 4,
                    secondWidget: Text("57".tr,
                        style: TextStyleFonts.Regular14.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7))),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () async {
                    final url =
                        "https://www.linkedin.com/company/ruknit/?viewAsMember=true";
                    launcher.launchUrl(await Uri.parse(url));
                  },
                  child: CustomListTile(
                    firstWidget: SvgPicture.asset("assets/icons/linkiden.svg",
                        width: 20.w, height: 20.h),
                    space: 4,
                    secondWidget: Text("58".tr,
                        style: TextStyleFonts.Regular14.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7))),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () async {
                    final url = "https://twitter.com/rukn_it";
                    launcher.launchUrl(await Uri.parse(url));
                  },
                  child: CustomListTile(
                    firstWidget: SvgPicture.asset("assets/icons/twitter.svg",
                        width: 20.w, height: 20.h),
                    space: 4,
                    secondWidget: Text("59".tr,
                        style: TextStyleFonts.Regular14.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7))),
                  ),
                ),
                // SizedBox(
                //   height: 4.h,
                // ),
              ],
            ),
          ),
          Spacer(),
          Center(
            child: SvgPicture.asset("assets/icons/rukin2.svg",
                width: 50.w, height: 50.h),
          ),
          SizedBox(
            height: 48.h,
          )
        ],
      ),
    );
  }
}
