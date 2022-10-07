import 'package:flutter/material.dart';
import 'package:flutter_note_app_frontend/data/data.dart';
import 'package:flutter_note_app_frontend/data/note_model/note_model.dart';

enum ActionType { addNote, editNote }

class ScreenAddNote extends StatelessWidget {
  final ActionType type;
  String? id;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final _scaffoldkey = GlobalKey<ScaffoldState>();
  ScreenAddNote({super.key, this.id, required this.type});
  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              saveNote();
              break;
            case ActionType.editNote:
              //editnote
              break;
          }
        },
        icon: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: const Text(
          'save',
          style: TextStyle(color: Colors.white),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(type.name.toUpperCase()),
        actions: [
          saveButton,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Titile',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _contentController,
                maxLines: 4,
                maxLength: 100,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Content',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;

    final _newNote = NoteModel.create(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );
    final newNote = NoteDb().createNotes(_newNote);
    if (newNote != null) {
      print('note saved');
      Navigator.of(_scaffoldkey.currentContext!).pop();
    } else {
      print('Error while saving');
    }
  }
}
