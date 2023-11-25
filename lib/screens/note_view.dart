import 'package:flutter/material.dart';
import 'package:flutter_noteapp/models/note_model.dart';
class NoteView extends StatelessWidget {
  final TextEditingController titlecont = TextEditingController();
  final TextEditingController bodycont = TextEditingController();

 NoteView({Key?key, required this.note, required this.index, required this.onNoteDelete, required this.onNewNoteCreate,}): super(key: key);
  final Note note;
  final int index;
  final Function(int) onNoteDelete;
  final Function(Note) onNewNoteCreate;
  @override
  Widget build(BuildContext context) {
    titlecont.text=note.title;
    bodycont.text=note.body;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context,
             builder: (context){
              return AlertDialog(
                title: const Text("Delete This ?"),
                content: Text("Note ${note.title} will be deleted!"),

                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      onNoteDelete(index);
                      Navigator.of(context).pop();
                    }, 
                    child: const Text("DELETE"),
                    ),
                     TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: const Text("CANCEL"),
                    ),
                ],
              );
             }
            );
          },
           icon: const Icon(Icons.delete)),
           IconButton(
            onPressed: () {
              
              final newnote = Note(body: bodycont.text, title: titlecont.text);

              onNewNoteCreate(newnote);
              onNoteDelete(index);
              Navigator.of(context).pop(index);


            },
            icon:const Icon(Icons.save)

           ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets .all(10.0),
        child: Column(
          children:[
          TextFormField(
            controller: titlecont,
            style: const TextStyle(fontSize: 29),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: bodycont,
            style: const TextStyle(fontSize: 29),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ],
        ),
      ),
    );
  }
}
