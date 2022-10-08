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
        BaseOptions(baseUrl: url.baseUrl, responseType: ResponseType.json);
  }

//!create note
  @override
  Future<NoteModel?> createNotes(NoteModel value) async {
    try {
      final _result = await dio.post(
        url.createNote,
        data: value.toJson(),
      );
      final _resultasJson = jsonDecode(_result.data);
      return NoteModel.fromJson(_resultasJson as Map<String, dynamic>);
    } on DioError catch (e) {
      print(e.response?.data);
      print(e);
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<void> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

//!get notes by list
  @override
  Future<List<NoteModel>> getNotes() async {
    final _result = await dio.get(url.baseUrl + url.getAllNote);

    if (_result.data != null) {
      final _resultAsJson = jsonDecode(_result.data);
      final getNoteResponse = GetAllNotesResp.fromJson(_resultAsJson);
      return getNoteResponse.data;
    } else {
      return [];
    }
  }

  @override
  Future<NoteModel> updateNote(NoteModel value) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
