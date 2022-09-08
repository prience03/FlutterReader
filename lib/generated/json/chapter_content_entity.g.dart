import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/model/novel/chapter_content_entity.dart';

ChapterContentEntity $ChapterContentEntityFromJson(Map<String, dynamic> json) {
	final ChapterContentEntity chapterContentEntity = ChapterContentEntity();
	final List<ChapterContentChapterList>? chapterList = jsonConvert.convertListNotNull<ChapterContentChapterList>(json['chapterList']);
	if (chapterList != null) {
		chapterContentEntity.chapterList = chapterList;
	}
	final String? errorCode = jsonConvert.convert<String>(json['error_code']);
	if (errorCode != null) {
		chapterContentEntity.errorCode = errorCode;
	}
	return chapterContentEntity;
}

Map<String, dynamic> $ChapterContentEntityToJson(ChapterContentEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['chapterList'] =  entity.chapterList?.map((v) => v.toJson()).toList();
	data['error_code'] = entity.errorCode;
	return data;
}

ChapterContentChapterList $ChapterContentChapterListFromJson(Map<String, dynamic> json) {
	final ChapterContentChapterList chapterContentChapterList = ChapterContentChapterList();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		chapterContentChapterList.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		chapterContentChapterList.name = name;
	}
	final String? isVip = jsonConvert.convert<String>(json['isVip']);
	if (isVip != null) {
		chapterContentChapterList.isVip = isVip;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		chapterContentChapterList.content = content;
	}
	final String? flag = jsonConvert.convert<String>(json['flag']);
	if (flag != null) {
		chapterContentChapterList.flag = flag;
	}
	return chapterContentChapterList;
}

Map<String, dynamic> $ChapterContentChapterListToJson(ChapterContentChapterList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['isVip'] = entity.isVip;
	data['content'] = entity.content;
	data['flag'] = entity.flag;
	return data;
}