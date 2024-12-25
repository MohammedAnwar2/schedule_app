import 'package:flutter/material.dart';
import 'package:schedule_app/components/CustomColorContainer.dart';
import 'package:schedule_app/core/constants/themeOfApp/colorConstants.dart';

selectColorFunction({
  required int selectColor,
  required Function? Function(int i) selectColorFun,
}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          colors.length,
          (i) => GestureDetector(
                onTap: () {
                  selectColorFun(i);
                },
                child: CustomColorContainer(
                    color: colors[i], select: selectColor == i ? true : false),
              )));
}
// ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:schedule_app/components/CustomColorContainer.dart';
// import 'package:schedule_app/core/constants/themeOfApp/colorConstants.dart';

// selectColorFunction<T extends GetxController>({
//   required int selectColor,
//   required Function(int color)? selectColorFun,
//   T? genericObject,
// }) {
//   return GetBuilder<T>(
//     init: genericObject,
//     initState: (_) {},
//     builder: (_) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(
//           colors.length,
//           (i) => GestureDetector(
//             onTap: () {
//               selectColorFun!(i);
//             },
//             child: CustomColorContainer(
//               color: colors[i],
//               select: selectColor == i ? true : false,
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
