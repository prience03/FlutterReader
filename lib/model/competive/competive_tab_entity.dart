import 'dart:convert';
import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/competive_tab_entity.g.dart';

@JsonSerializable()
class CompetiveTabEntity {

	int? code;
	String? msg;
	List<CompetiveTabData>? data;
  
  CompetiveTabEntity();

  factory CompetiveTabEntity.fromJson(Map<String, dynamic> json) => $CompetiveTabEntityFromJson(json);

  Map<String, dynamic> toJson() => $CompetiveTabEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CompetiveTabData {

	int? id;
	int? idx;
	String? tagName;
	int? tagType;
	int? tagGroup;
	dynamic tagId;
	dynamic tagRule;
	String? appName;
	int? startVersion;
	int? endVersion;
	String? exceptVersion;
	int? deleteFlag;
	String? createDate;
	String? updateDate;
	int? tagPlace;
	bool? openTheme;
	dynamic themeImages;
	dynamic themeTitleImages;
	dynamic themeBgColor;
  
  CompetiveTabData();

  factory CompetiveTabData.fromJson(Map<String, dynamic> json) => $CompetiveTabDataFromJson(json);

  Map<String, dynamic> toJson() => $CompetiveTabDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}