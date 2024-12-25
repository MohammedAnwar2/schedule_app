import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colorConstants.dart';

/*
AppBar(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.green, // <-- SEE HERE
    statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
    statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
  ),
 */
class Themes {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff202122),
    appBarTheme: const AppBarTheme(
      color: Color(0xff202122),
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarColor: Colors.green, // <-- SEE HERE
      //   statusBarIconBrightness:
      //       Brightness.dark, //<-- For Android SEE HERE (dark icons)
      //   statusBarBrightness:
      //       Brightness.light, //<-- For iOS SEE HERE (dark icons)
      // )
    ),
    cardColor: const Color(0xff2F2E2E),
    hintColor: const Color(0xff545556),
    colorScheme: AppColorScheme().colorSchemeDarkMode,
    // textTheme: darkTextTheme,

    // appBarTheme: const AppBarTheme(color: Colors.yellowAccent),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //         backgroundColor: MaterialStateProperty.all(Colors.purpleAccent))),
  );

  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xffFAFAFA),
    appBarTheme: const AppBarTheme(
      color: Color(0xffFAFAFA),
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarColor: Colors.green, // <-- SEE HERE
      //   statusBarIconBrightness:
      //       Brightness.light, //<-- For Android SEE HERE (dark icons)
      //   statusBarBrightness:
      //       Brightness.light, //<-- For iOS SEE HERE (dark icons)
      // )
    ),
    cardColor: const Color(0xffE5E5E5),
    hintColor: const Color(0xff9C9C9C),
    colorScheme: AppColorScheme().colorSchemeLightMode,
    // textTheme: lightTextThene,

    //appBarTheme: const AppBarTheme(color: Colors.brown),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //         backgroundColor: MaterialStateProperty.all(Colors.orangeAccent))),
  );
}

// ignore_for_file: non_constant_identifier_names

// TextTheme darkTextTheme = TextTheme(
//     titleLarge: TextStyle(
//       fontSize: 28.sp, fontWeight: FontWeight.w700,
//       // height: 0.05,
//       // letterSpacing: -0.28,
//     ),
//     titleMedium: GoogleFonts.tajawal(
//       fontSize: 14.sp,
//       fontWeight: FontWeight.w400,
//       height: 0.11,
//       letterSpacing: -0.14,
//     ),
//     titleSmall: GoogleFonts.tajawal(
//       fontSize: 18.sp,
//       fontWeight: FontWeight.w700,
//       height: 0,
//     ),
//     headlineLarge: GoogleFonts.tajawal(
//       fontSize: 18.sp,
//       fontWeight: FontWeight.w400,
//       height: 0,
//     ),
//     headlineMedium: GoogleFonts.tajawal(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.w400,
//       height: 0,
//     ),
//     headlineSmall: GoogleFonts.tajawal(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.w700,
//       //  height: 0.09,
//       //  letterSpacing: -0.16,
//     ),
//     bodyLarge: GoogleFonts.tajawal(
//       fontSize: 14.sp,
//       fontWeight: FontWeight.w400,
//       height: 0.11,
//     ),
//     bodyMedium: GoogleFonts.tajawal(
//       fontSize: 12.sp,
//       fontWeight: FontWeight.w500,
//       height: 0.11,
//       letterSpacing: -0.12,
//     ),
//     bodySmall: GoogleFonts.tajawal(
//       fontSize: 28.sp,
//       fontWeight: FontWeight.w500,
//       height: 0,
//     ),
//     displayLarge: GoogleFonts.tajawal(
//       fontSize: 12.sp,
//       fontWeight: FontWeight.w400,
//       height: 0.12,
//       letterSpacing: -0.12,
//     ),
//     displayMedium: GoogleFonts.tajawal(
//       fontSize: 28.sp,
//       fontWeight: FontWeight.w500,
//       height: 0,
//     ));

// TextTheme lightTextThene = TextTheme(
//     titleLarge: TextStyle(
//         fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.amber
//         // height: 0.05,
//         // letterSpacing: -0.28,
//         ),
//     titleMedium: GoogleFonts.tajawal(
//       fontSize: 14.sp,
//       fontWeight: FontWeight.w400,
//       height: 0.11,
//       letterSpacing: -0.14,
//     ),
//     titleSmall: GoogleFonts.tajawal(
//       fontSize: 18.sp,
//       fontWeight: FontWeight.w700,
//       height: 0,
//     ),
//     headlineLarge: GoogleFonts.tajawal(
//       fontSize: 18.sp,
//       fontWeight: FontWeight.w400,
//       height: 0,
//     ),
//     headlineMedium: GoogleFonts.tajawal(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.w400,
//       height: 0,
//     ),
//     headlineSmall: GoogleFonts.tajawal(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.w700,
//       //  height: 0.09,
//       //  letterSpacing: -0.16,
//     ),
//     bodyLarge: GoogleFonts.tajawal(
//       fontSize: 14.sp,
//       fontWeight: FontWeight.w400,
//       height: 0.11,
//     ),
//     bodyMedium: GoogleFonts.tajawal(
//       fontSize: 12.sp,
//       fontWeight: FontWeight.w500,
//       height: 0.11,
//       letterSpacing: -0.12,
//     ),
//     bodySmall: GoogleFonts.tajawal(
//       fontSize: 28.sp,
//       fontWeight: FontWeight.w500,
//       height: 0,
//     ),
//     displayLarge: GoogleFonts.tajawal(
//       fontSize: 12.sp,
//       fontWeight: FontWeight.w400,
//       height: 0.12,
//       letterSpacing: -0.12,
//     ),
//     displayMedium: GoogleFonts.tajawal(
//       fontSize: 28.sp,
//       fontWeight: FontWeight.w500,
//       height: 0,
//     ));
