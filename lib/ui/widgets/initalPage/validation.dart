// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

InitailPageValidation({required String val}) {
  if (val.length > 16) {
    return "87".tr;
  } else if (val.length == 0) {
    return "86".tr;
  } else {
    return null;
  }
}
