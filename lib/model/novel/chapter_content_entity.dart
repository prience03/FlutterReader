import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/chapter_content_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ChapterContentEntity {

	List<ChapterContentChapterList>? chapterList;
	@JSONField(name: "error_code")
	String? errorCode;
  
  ChapterContentEntity();

  factory ChapterContentEntity.fromJson(Map<String, dynamic> json) => $ChapterContentEntityFromJson(json);

  Map<String, dynamic> toJson() => $ChapterContentEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ChapterContentChapterList {

	String? id;
	String? name;
	String? isVip;
	String? content;
	String? flag;
  
  ChapterContentChapterList();

  factory ChapterContentChapterList.fromJson(Map<String, dynamic> json) => $ChapterContentChapterListFromJson(json);

  Map<String, dynamic> toJson() => $ChapterContentChapterListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}