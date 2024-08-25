
// ignore_for_file: avoid_unnecessary_containers, file_names, duplicate_ignore

import 'dart:developer';

// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flut_test/views/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

import '../services/signUpServices.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  User ? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text("SignUp"),
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    hintText: 'User Name',
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
                  controller: userPhoneController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.call),
                    hintText: 'Phone',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userEmailController,
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
                  controller: userPasswordController,
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
                  var userName = userNameController.text.trim();
                  var userPhone = userPhoneController.text.trim();
                  var userEmail = userEmailController.text.trim();
                  var userPassword = userPasswordController.text.trim();

                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword (
                          email: userEmail, password: userPassword)
                      .then((value) => {
                       log("user Created"),
                        signUpUser(userName,userPhone,userEmail,userPassword),
                          });
                },
                child: const Text("SignUp"),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => const LoginScreen(),
                  );
                },
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Already have an account? Login"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
