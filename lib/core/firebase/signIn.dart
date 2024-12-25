import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/services/services.dart';

void signIn() async {
  try {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({
      "UserUid": userCredential.user!.uid,
    }).then(
      (value) =>
          SettingServices.instance.write(Keys.uid, userCredential.user!.uid),
    );

    print("Signed in with temporary account.");
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        Get.snackbar(
            "error", "Anonymous auth hasn't been enabled for this project.");
        print("Anonymous auth hasn't been enabled for this project.");
        break;
      default:
        Get.snackbar("error", "Unknown error.");
        print("Unknown error.");
    }
  }
}

// void checkSingIn() {
//   bool c = false;

//   if (NetworkController.instance.connectionStatus.value == 1 ||
//       NetworkController.instance.connectionStatus.value == 2) {
//     c = true;
//     // print("Get.snackbar(error, Connection);");
//     // return Container();
//   } else {
//     //c = true;

//     // print("Get.snackbar(ok, Connection);");
//     ;
//     // return Container();
//   }

//   if (c) {
//     signIn();
//     print("Get.snackbar(ok, Connection);");
//   } else {
//     print("Get.snackbar(error, Connection);");
//   }
// }
