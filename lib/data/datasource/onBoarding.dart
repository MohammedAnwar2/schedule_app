// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:schedule_app/core/constants/imageAsset.dart/images.dart';
import 'package:schedule_app/data/models/onboardingModel.dart';

List<OnBoardingModel> OnBoardingListEnglish = [
  OnBoardingModel(
    image: Get.isDarkMode
        ? ImageAssetDarkModEnglish.onBoardingImageTwo
        : ImageAssetLightModEnglish.onBoardingImageTwo,
    title: "Choose your preferred \nlanguage",
    body: "",
  ),
  OnBoardingModel(
      image: Get.isDarkMode
          ? ImageAssetDarkModEnglish.onBoardingImageThree
          : ImageAssetLightModEnglish.onBoardingImageThree,
      title: "Your Class Schedule",
      body:
          "Set up your class schedule in a snap \nNever miss a lecture or deadline again."),
  OnBoardingModel(
      image: Get.isDarkMode
          ? ImageAssetDarkModEnglish.onBoardingImageFoure
          : ImageAssetLightModEnglish.onBoardingImageFoure,
      title: "Stay Organized",
      body:
          "Keep track of assignments with our easy-to-\nuse To-Do Lists and allocate time for \ndifferent activities."),
  OnBoardingModel(
      image: Get.isDarkMode
          ? ImageAssetDarkModEnglish.onBoardingImageFive
          : ImageAssetLightModEnglish.onBoardingImageFive,
      title: "Boost Focus",
      body:
          "Try the Pomodoro Technique. Break tasks \ninto focused intervals for maximum \nefficiency."),
  OnBoardingModel(
      image: Get.isDarkMode
          ? ImageAssetDarkModEnglish.initailPageImage
          : ImageAssetLightModEnglish.initailPageImage,
      title: "Boost Focus",
      body:
          "Try the Pomodoro Technique. Break tasks \ninto focused intervals for maximum \nefficiency."),
];

List<OnBoardingModel> OnBoardingListArabic = [
  OnBoardingModel(
    image: Get.isDarkMode
        ? ImageAssetDarkModArabic.onBoardingImageTwo
        : ImageAssetLightModArabic.onBoardingImageTwo,
    title: "أختر لغتك المفضلة",
    body: "",
  ),
  OnBoardingModel(
      image: Get.isDarkMode
          ? ImageAssetDarkModArabic.onBoardingImageThree
          : ImageAssetLightModArabic.onBoardingImageThree,
      title: "نظم جدولك الدراسي",
      body:
          "قم بإعداد جدول فصولك بكل سهولة.\nلن تفوت أي محاضرة أو واجب مرة أخرى."),
  OnBoardingModel(
      image: Get.isDarkMode
          ? ImageAssetDarkModArabic.onBoardingImageFoure
          : ImageAssetLightModArabic.onBoardingImageFoure,
      title: "ابقاء منظمًا",
      body:
          "حافظ على تنظيمك باستخدام قوائم المهام \nلبسيطة لدينا و قم بتخصيص فترات زمنية\nلأنشطتك المختلفة."),
  OnBoardingModel(
      image: Get.isDarkMode
          ? ImageAssetDarkModArabic.onBoardingImageFive
          : ImageAssetLightModArabic.onBoardingImageFive,
      title: "عزز تركيزك",
      body:
          "جرب تقنية الطماطم وقسم يومك إلى فترات\nمركزة قصيرة لتعزيز تركيزك وإنتاجيتك."),
  OnBoardingModel(
      image: Get.isDarkMode
          ? ImageAssetDarkModArabic.initailPageImage
          : ImageAssetLightModArabic.initailPageImage,
      title: "عزز تركيزك",
      body:
          "جرب تقنية الطماطم وقسم يومك إلى فترات\nمركزة قصيرة لتعزيز تركيزك وإنتاجيتك."),
];
