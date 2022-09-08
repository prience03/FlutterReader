import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/chapternew_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ChapternewEntity {

	@JSONField(name: "error_code")
	String? errorCode;
	List<ChapternewList>? list;
	int? date;
  
  ChapternewEntity();

  factory ChapternewEntity.fromJson(Map<String, dynamic> json) => $ChapternewEntityFromJson(json);

  Map<String, dynamic> toJson() => $ChapternewEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ChapternewList {

	List<ChapternewListBookChapters>? bookChapters;
	String? name;
	int? id;
	int? idx;
	String? bookId;
	int? buyout;
	dynamic code;
	dynamic other;
	dynamic cpVolumeId;
  
  ChapternewList();

  factory ChapternewList.fromJson(Map<String, dynamic> json) => $ChapternewListFromJson(json);

  Map<String, dynamic> toJson() => $ChapternewListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ChapternewListBookChapters {

	int? mp3Time;
	String? updateDate;
	int? mp3Exist;
	String? mp3CreateDate;
	int? chapterindex;
	int? wordCount;
	String? cdnUrl;
	int? contentstatus;
	int? s3exist;
	int? version;
	String? isVip;
	String? bookid;
	String? mp3Path;
	int? mp3Sex;
	int? volumeId;
	String? name;
	int? id;
	int? status;
	String? createDate;
	int? idx;
	dynamic chapterNum;
	dynamic charge;
	dynamic cpautoid;
  
  ChapternewListBookChapters();

  factory ChapternewListBookChapters.fromJson(Map<String, dynamic> json) => $ChapternewListBookChaptersFromJson(json);

  Map<String, dynamic> toJson() => $ChapternewListBookChaptersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}