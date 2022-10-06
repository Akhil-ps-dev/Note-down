import 'package:dio/dio.dart';
import 'package:flutter_note_app_frontend/data/note_model/note_model.dart';
import 'package:flutter_note_app_frontend/data/url.dart';

abstract class ApiCall {
//!functions of get put post delete

//!create note
  Future<NoteModel?> createNotes(NoteModel value);

//!get notes by list
  Future<List<NoteModel>> getNotes();

//!update
  Future<NoteModel?> updateNote(NoteModel value);

//!delete
  Future<void> deleteNote(String id);
}

class NoteDb extends ApiCall {
  final dio = Dio();
  final url = Url();
  @override
  Future<NoteModel?> createNotes(NoteModel value) async {
    final _result = await dio.post<NoteModel>(url.baseUrl + url.createNote);
    return _result.data;
  }

  @override
  Future<void> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<NoteModel> updateNote(NoteModel value) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
