import 'package:flutter/material.dart';
import 'package:flutter_note_app_frontend/data/data.dart';
import 'package:flutter_note_app_frontend/data/note_model/note_model.dart';
import 'package:flutter_note_app_frontend/view/screen_add_note.dart';

class ScreenAllNote extends StatefulWidget {
  ScreenAllNote({super.key});

  @override
  State<ScreenAllNote> createState() => _ScreenAllNoteState();
}

class _ScreenAllNoteState extends State<ScreenAllNote> {
  //!creating temporary list outside
  final List<NoteModel> noteList = [];

  @override
  Widget build(BuildContext context) {
    //! 'addPostFrameCallback'--call only aftr the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _noteList = await NoteDb().getNotes();
      _noteList.clear();
      setState(() {
        noteList.addAll(_noteList);
      });
      print(_noteList);
    });
    setState(() {
      noteList.addAll(noteList);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Notes'),
      ),
      body: SafeArea(
        child: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(noteList.length, (index) {
            final note = noteList[index];
            if (note.id == null) {
              return SizedBox();
            }

            return NoteItem(
              id: note.id!,
              title: note.title ?? 'No Title',
              content: note.content ?? 'No Content',
            );
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScreenAddNote(type: ActionType.addNote),
            ),
          );
        },
        label: const Text('New'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  final String id;
  final String title;
  final String content;

  const NoteItem(
      {super.key,
      required this.id,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ScreenAddNote(type: ActionType.editNote);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ],
              ),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
