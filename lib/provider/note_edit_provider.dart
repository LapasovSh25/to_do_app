import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/style/app_style.dart';

class NoteEditingProvider extends ChangeNotifier{
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();

  Future<dynamic> AddNoteToFirebase()async{
    try {
      FirebaseFirestore.instance.collection("Notes").add({
            "note_title": titleController.text,
            "note_content": mainController.text,
            "creation_date": date,
            "color_id": color_id
          });
    } catch (error) {
      debugPrint(error.toString());
    }
    
  }
}