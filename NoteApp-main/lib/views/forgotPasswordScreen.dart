// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flut_test/views/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text("Forgot Password"),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 250,
                child: Lottie.asset("assets/login.json"),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: forgetPasswordController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    hintText: 'Enter your Email',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  var forgotEmail = forgetPasswordController.text.trim();
                  try{
                   await FirebaseAuth.instance.sendPasswordResetEmail(email: forgotEmail).
                    then((value) => {
                      print("Email sent!"),
                     Get.off(()=>LoginScreen()),

                    });
                  }on FirebaseAuthException catch(e){
                    print("Error $e");
                  }
                },
                child: const Text("Forgot Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
