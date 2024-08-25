import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flut_test/views/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController noteEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ediit Notes"),
      ),
      body: Container(
          child: Column(
        children: [
          TextFormField(
            controller: noteEditController
              ..text = "${Get.arguments['note'].toString()}",
          ),
          ElevatedButton(
            onPressed: () async {
             await FirebaseFirestore.instance
                  .collection("notes")
                  .doc(
                    Get.arguments["docId"].toString(),
                  )
                  .update({
                'note':noteEditController.text.trim(),
              }).then((value) => {
                Get.offAll(()=> HomeScreen()),
                log("Data updated")
             });
            },
            child: Text("Update"),
          ),
        ],
      )),
    );
  }
}
