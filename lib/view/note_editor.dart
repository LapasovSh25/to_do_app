import 'package:flutter/material.dart';
import 'package:to_do_app/provider/note_edit_provider.dart';
import 'package:to_do_app/style/app_style.dart';

class NoteEditorPAge extends StatefulWidget {
  const NoteEditorPAge({super.key});

  @override
  State<NoteEditorPAge> createState() => _NoteEditorPAgeState();
}

class _NoteEditorPAgeState extends State<NoteEditorPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[NoteEditingProvider().color_id],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppStyle.cardsColor[NoteEditingProvider().color_id],
        title: Text(
          "Adda new Note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: NoteEditingProvider().titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
              style: AppStyle.mainTitle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              NoteEditingProvider().date,
              style: AppStyle.dataTitle,
            ),
            SizedBox(
              height: 28,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: NoteEditingProvider().mainController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Note Content",
              ),
              style: AppStyle.mainContext,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          NoteEditingProvider().AddNoteToFirebase().then((value) {
            debugPrint(value.id);
            Navigator.pop(context);
          });
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
