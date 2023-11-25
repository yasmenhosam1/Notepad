
import 'package:flutter/material.dart';
import 'package:flutter_noteapp/models/note_model.dart';
import 'package:flutter_noteapp/screens/note_view.dart';

class NoteCard extends StatelessWidget {

 const NoteCard({Key? key, required this.note , required this.index, required this.onNoteDelete,required this.onNewNoteCreate,}) : super(key: key);

final Note note;
final int index;

final Function(int) onNoteDelete;
final Function(Note) onNewNoteCreate;


  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteView(note: note,index: index, onNoteDelete: onNoteDelete,onNewNoteCreate: onNewNoteCreate,)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      note.body,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
                ),
              
            );
  }
}