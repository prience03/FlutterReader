import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/model/competive/competive_tab_entity.dart';

CompetiveTabEntity $CompetiveTabEntityFromJson(Map<String, dynamic> json) {
	final CompetiveTabEntity competiveTabEntity = CompetiveTabEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		competiveTabEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		competiveTabEntity.msg = msg;
	}
	final List<CompetiveTabData>? data = jsonConvert.convertListNotNull<CompetiveTabData>(json['data']);
	if (data != null) {
		competiveTabEntity.data = data;
	}
	return competiveTabEntity;
}

Map<String, dynamic> $CompetiveTabEntityToJson(CompetiveTabEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

CompetiveTabData $CompetiveTabDataFromJson(Map<String, dynamic> json) {
	final CompetiveTabData competiveTabData = CompetiveTabData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		competiveTabData.id = id;
	}
	final int? idx = jsonConvert.convert<int>(json['idx']);
	if (idx != null) {
		competiveTabData.idx = idx;
	}
	final String? tagName = jsonConvert.convert<String>(json['tagName']);
	if (tagName != null) {
		competiveTabData.tagName = tagName;
	}
	final int? tagType = jsonConvert.convert<int>(json['tagType']);
	if (tagType != null) {
		competiveTabData.tagType = tagType;
	}
	final int? tagGroup = jsonConvert.convert<int>(json['tagGroup']);
	if (tagGroup != null) {
		competiveTabData.tagGroup = tagGroup;
	}
	final dynamic? tagId = jsonConvert.convert<dynamic>(json['tagId']);
	if (tagId != null) {
		competiveTabData.tagId = tagId;
	}
	final dynamic? tagRule = jsonConvert.convert<dynamic>(json['tagRule']);
	if (tagRule != null) {
		competiveTabData.tagRule = tagRule;
	}
	final String? appName = jsonConvert.convert<String>(json['appName']);
	if (appName != null) {
		competiveTabData.appName = appName;
	}
	final int? startVersion = jsonConvert.convert<int>(json['startVersion']);
	if (startVersion != null) {
		competiveTabData.startVersion = startVersion;
	}
	final int? endVersion = jsonConvert.convert<int>(json['endVersion']);
	if (endVersion != null) {
		competiveTabData.endVersion = endVersion;
	}
	final String? exceptVersion = jsonConvert.convert<String>(json['exceptVersion']);
	if (exceptVersion != null) {
		competiveTabData.exceptVersion = exceptVersion;
	}
	final int? deleteFlag = jsonConvert.convert<int>(json['deleteFlag']);
	if (deleteFlag != null) {
		competiveTabData.deleteFlag = deleteFlag;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		competiveTabData.createDate = createDate;
	}
	final String? updateDate = jsonConvert.convert<String>(json['updateDate']);
	if (updateDate != null) {
		competiveTabData.updateDate = updateDate;
	}
	final int? tagPlace = jsonConvert.convert<int>(json['tagPlace']);
	if (tagPlace != null) {
		competiveTabData.tagPlace = tagPlace;
	}
	final bool? openTheme = jsonConvert.convert<bool>(json['openTheme']);
	if (openTheme != null) {
		competiveTabData.openTheme = openTheme;
	}
	final dynamic? themeImages = jsonConvert.convert<dynamic>(json['themeImages']);
	if (themeImages != null) {
		competiveTabData.themeImages = themeImages;
	}
	final dynamic? themeTitleImages = jsonConvert.convert<dynamic>(json['themeTitleImages']);
	if (themeTitleImages != null) {
		competiveTabData.themeTitleImages = themeTitleImages;
	}
	final dynamic? themeBgColor = jsonConvert.convert<dynamic>(json['themeBgColor']);
	if (themeBgColor != null) {
		competiveTabData.themeBgColor = themeBgColor;
	}
	return competiveTabData;
}

Map<String, dynamic> $CompetiveTabDataToJson(CompetiveTabData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['idx'] = entity.idx;
	data['tagName'] = entity.tagName;
	data['tagType'] = entity.tagType;
	data['tagGroup'] = entity.tagGroup;
	data['tagId'] = entity.tagId;
	data['tagRule'] = entity.tagRule;
	data['appName'] = entity.appName;
	data['startVersion'] = entity.startVersion;
	data['endVersion'] = entity.endVersion;
	data['exceptVersion'] = entity.exceptVersion;
	data['deleteFlag'] = entity.deleteFlag;
	data['createDate'] = entity.createDate;
	data['updateDate'] = entity.updateDate;
	data['tagPlace'] = entity.tagPlace;
	data['openTheme'] = entity.openTheme;
	data['themeImages'] = entity.themeImages;
	data['themeTitleImages'] = entity.themeTitleImages;
	data['themeBgColor'] = entity.themeBgColor;
	return data;
}