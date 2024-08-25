
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flut_test/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flut_test/views/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
       ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyDrGIZXoKjifT9LPyxmtAdZHrRvmxS2gEA',
              appId: '1:643652532883:android:454a9ab4530cebda8d6b66',
              messagingSenderId: '643652532883',
              projectId: 'noteapp-76019'))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  }


class _MyAppState extends State<MyApp> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    print(user?.uid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user != null ? const HomeScreen(): const LoginScreen(),
    );
  }
}
