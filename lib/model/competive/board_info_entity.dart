import 'dart:convert';
import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/board_info_entity.g.dart';

@JsonSerializable()
class BoardInfoEntity {

	int? code;
	String? msg;
	BoardInfoData? data;
  
  BoardInfoEntity();

  factory BoardInfoEntity.fromJson(Map<String, dynamic> json) => $BoardInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $BoardInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BoardInfoData {

	List<BoardInfoDataActivitys>? activitys;
	List<BoardInfoDataBanner>? banner;
	List<BoardInfoDataBangdan>? bangdan;
	List<BoardInfoDataTags>? tags;
  
  BoardInfoData();

  factory BoardInfoData.fromJson(Map<String, dynamic> json) => $BoardInfoDataFromJson(json);

  Map<String, dynamic> toJson() => $BoardInfoDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BoardInfoDataActivitys {

	int? id;
	String? activityName;
	String? activityText;
	String? activityUrl;
	String? imgUrl;
	int? activityType;
	int? idx;
	String? createDate;
	String? updateDate;
  
  BoardInfoDataActivitys();

  factory BoardInfoDataActivitys.fromJson(Map<String, dynamic> json) => $BoardInfoDataActivitysFromJson(json);

  Map<String, dynamic> toJson() => $BoardInfoDataActivitysToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BoardInfoDataBanner {

	int? id;
	String? bannerName;
	String? bannerText;
	String? bannerImg;
	String? bannerUrl;
  
  BoardInfoDataBanner();

  factory BoardInfoDataBanner.fromJson(Map<String, dynamic> json) => $BoardInfoDataBannerFromJson(json);

  Map<String, dynamic> toJson() => $BoardInfoDataBannerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BoardInfoDataBangdan {

	int? showCount;
	int? flag;
	String? actionUrl;
	String? name;
	@JSONField(name: "show")
	int? xShow;
	int? index;
	int? id;
	int? idx;
	List<BoardInfoDataBangdanList>? list;
	int? showPropertyType;
	String? actionName;
	String? nameText;
  
  BoardInfoDataBangdan();

  factory BoardInfoDataBangdan.fromJson(Map<String, dynamic> json) => $BoardInfoDataBangdanFromJson(json);

  Map<String, dynamic> toJson() => $BoardInfoDataBangdanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BoardInfoDataBangdanList {

	String? categoryColor;
	String? wordCount;
	int? categoryThr;
	String? categoryName;
	String? bookid;
	List<BoardInfoDataBangdanListTags>? tags;
	String? cover;
	String? bookStatue;
	String? newBookName;
	String? authorName;
	String? grade;
	String? intro;
	String? popularity;
	String? online;
	int? categorySec;
  
  BoardInfoDataBangdanList();

  factory BoardInfoDataBangdanList.fromJson(Map<String, dynamic> json) => $BoardInfoDataBangdanListFromJson(json);

  Map<String, dynamic> toJson() => $BoardInfoDataBangdanListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BoardInfoDataBangdanListTags {

	String? name;
	int? id;
	int? hot;
  
  BoardInfoDataBangdanListTags();

  factory BoardInfoDataBangdanListTags.fromJson(Map<String, dynamic> json) => $BoardInfoDataBangdanListTagsFromJson(json);

  Map<String, dynamic> toJson() => $BoardInfoDataBangdanListTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BoardInfoDataTags {

	int? id;
	String? tagName;
	String? tagText;
	String? tagUrl;
	String? imgUrl;
	int? tagType;
	int? idx;
	String? createDate;
	String? updateDate;
  
  BoardInfoDataTags();

  factory BoardInfoDataTags.fromJson(Map<String, dynamic> json) => $BoardInfoDataTagsFromJson(json);

  Map<String, dynamic> toJson() => $BoardInfoDataTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}