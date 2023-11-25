

import 'package:flutter/material.dart';
import 'package:flutter_noteapp/models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key, required this.onNewNoteCreate}) : super(key: key);

  final Function(Note) onNewNoteCreate;

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final  titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(fontSize: 29),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Title"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(fontSize: 19),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Your Story"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }
          final newnote=Note(
            body: bodyController.text,
            title: titleController.text
          );
          widget.onNewNoteCreate(newnote);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
