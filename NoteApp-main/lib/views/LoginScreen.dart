// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:flut_test/views/forgotPasswordScreen.dart';
import 'package:flut_test/views/signUpScreen.dart';

import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange.shade400,
        centerTitle: true,
        title: const Text("Login"),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              child: Lottie.asset("assets/login.json"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: loginEmailController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: loginPasswordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.key_rounded),
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var loginEmail = loginEmailController.text.trim();
                var loginPassword = loginPasswordController.text.trim();

                try {
                  final User? firebaseUser = (await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: loginEmail, password: loginPassword)).user;
                  if(firebaseUser != null){
                    Get.to(()=>HomeScreen());
                  }else{
                    print("Check email or Password");
                  }
                } on FirebaseAuthException catch (e) {
                  print("Error $e");
                }
              },
              child: const Text("Login"),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ForgotPasswordScreen());
                },
                child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Forgot Password?"),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(const SignUpScreen());
              },
              child: Container(
                child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Don't have an account? SignUp"),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
