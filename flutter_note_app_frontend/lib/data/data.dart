import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_note_app_frontend/data/get_all_notes_resp/get_all_notes_resp.dart';
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
  NoteDb() {
    dio.options =
        BaseOptions(baseUrl: url.baseUrl, responseType: ResponseType.plain);
  }

  @override
  Future<NoteModel?> createNotes(NoteModel value) async {
    try {
      final _result = await dio.post(
        url.baseUrl + url.createNote,
        data: value.toJson(),
      );
      final _resultasJson = jsonDecode(_result.data);
      return NoteModel.fromJson(_resultasJson);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    final _result =
        await dio.get<GetAllNotesResp>(url.baseUrl + url.getAllNote);
    if (_result.data == null) {
      return [];
    } else {
      return _result.data!.data;
    }
  }

  @override
  Future<NoteModel> updateNote(NoteModel value) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
