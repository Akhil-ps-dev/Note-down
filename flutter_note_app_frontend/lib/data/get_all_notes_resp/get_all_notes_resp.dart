import 'package:flutter_note_app_frontend/data/note_model/note_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'get_all_notes_resp.g.dart';

@JsonSerializable()
class GetAllNotesResp {
//! added @jsonkey
  @JsonKey(name: 'data')
  List<NoteModel> data;

  GetAllNotesResp({this.data = const []});

  factory GetAllNotesResp.fromJson(Map<String, dynamic> json) {
    return _$GetAllNotesRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllNotesRespToJson(this);
}
