import 'package:flutter/material.dart';
import 'package:flutter_noteapp/models/note_model.dart';
import 'package:flutter_noteapp/screens/creat_note.dart';
import 'package:flutter_noteapp/widgets/note_card.dart';
// ignore: camel_case_types
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

// ignore: camel_case_types
class _homescreenState extends State<homescreen> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Notes"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context,
               delegate: CustomSearch()
              );
            },
            )
        ],
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteCard(note: notes[index], index: index, onNoteDelete:onNoteDelete,onNewNoteCreate:onNewNoteCreate,);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>  CreateNote(onNewNoteCreate: onNewNoteCreate,)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreate(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDelete(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
class CustomSearch extends  SearchDelegate {
  List<String> allData = [
    'Yasmin', 'Yasmeen','Nada','Nermin'
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
         icon: const Icon(Icons.clear),
         onPressed: () {
          query = '';
         }

         )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
   return IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
       close(context,null);
    },
   );
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
    itemBuilder: (context, index) {
      var result = matchQuery[index];
      return ListTile(
      title:Text(result),

      );
    }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   List<String> matchQuery = [];
    for(var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
    itemBuilder: (context, index) {
      var result = matchQuery[index];
      return ListTile(
      title:Text(result),

      );
    }
    );
  }

  
}
