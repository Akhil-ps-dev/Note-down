import 'package:flutter/material.dart';

enum ActionType { addNote, editNote }

class ScreenAddNote extends StatelessWidget {
  final ActionType type;
  String? id;

  ScreenAddNote({super.key, this.id, required this.type});
  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              //addNote
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Titile',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
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
}
