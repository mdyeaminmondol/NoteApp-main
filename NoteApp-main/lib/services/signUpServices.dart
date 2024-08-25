
// ignore_for_file: avoid_print, prefer_const_constructors, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flut_test/views/LoginScreen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

signUpUser(String userName, String userPhone, String userEmail,
    String userPassword) async {
  User? userId = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("users").doc(userId!.uid).set({
      "userName": userName,
      "userPhone": userPhone,
      "userEmail": userEmail,
      "createdAt": DateTime.now(),
      "userId": userId.uid,
    }).then((value) => {
      FirebaseAuth.instance.signOut(),
          Get.to(() => LoginScreen()),
        });
  } on FirebaseAuthException catch (e) {
    print("Error $e");
  }
}
