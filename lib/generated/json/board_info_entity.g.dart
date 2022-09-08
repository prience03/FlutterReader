import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/model/competive/board_info_entity.dart';

BoardInfoEntity $BoardInfoEntityFromJson(Map<String, dynamic> json) {
	final BoardInfoEntity boardInfoEntity = BoardInfoEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		boardInfoEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		boardInfoEntity.msg = msg;
	}
	final BoardInfoData? data = jsonConvert.convert<BoardInfoData>(json['data']);
	if (data != null) {
		boardInfoEntity.data = data;
	}
	return boardInfoEntity;
}

Map<String, dynamic> $BoardInfoEntityToJson(BoardInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

BoardInfoData $BoardInfoDataFromJson(Map<String, dynamic> json) {
	final BoardInfoData boardInfoData = BoardInfoData();
	final List<BoardInfoDataActivitys>? activitys = jsonConvert.convertListNotNull<BoardInfoDataActivitys>(json['activitys']);
	if (activitys != null) {
		boardInfoData.activitys = activitys;
	}
	final List<BoardInfoDataBanner>? banner = jsonConvert.convertListNotNull<BoardInfoDataBanner>(json['banner']);
	if (banner != null) {
		boardInfoData.banner = banner;
	}
	final List<BoardInfoDataBangdan>? bangdan = jsonConvert.convertListNotNull<BoardInfoDataBangdan>(json['bangdan']);
	if (bangdan != null) {
		boardInfoData.bangdan = bangdan;
	}
	final List<BoardInfoDataTags>? tags = jsonConvert.convertListNotNull<BoardInfoDataTags>(json['tags']);
	if (tags != null) {
		boardInfoData.tags = tags;
	}
	return boardInfoData;
}

Map<String, dynamic> $BoardInfoDataToJson(BoardInfoData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['activitys'] =  entity.activitys?.map((v) => v.toJson()).toList();
	data['banner'] =  entity.banner?.map((v) => v.toJson()).toList();
	data['bangdan'] =  entity.bangdan?.map((v) => v.toJson()).toList();
	data['tags'] =  entity.tags?.map((v) => v.toJson()).toList();
	return data;
}

BoardInfoDataActivitys $BoardInfoDataActivitysFromJson(Map<String, dynamic> json) {
	final BoardInfoDataActivitys boardInfoDataActivitys = BoardInfoDataActivitys();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		boardInfoDataActivitys.id = id;
	}
	final String? activityName = jsonConvert.convert<String>(json['activityName']);
	if (activityName != null) {
		boardInfoDataActivitys.activityName = activityName;
	}
	final String? activityText = jsonConvert.convert<String>(json['activityText']);
	if (activityText != null) {
		boardInfoDataActivitys.activityText = activityText;
	}
	final String? activityUrl = jsonConvert.convert<String>(json['activityUrl']);
	if (activityUrl != null) {
		boardInfoDataActivitys.activityUrl = activityUrl;
	}
	final String? imgUrl = jsonConvert.convert<String>(json['imgUrl']);
	if (imgUrl != null) {
		boardInfoDataActivitys.imgUrl = imgUrl;
	}
	final int? activityType = jsonConvert.convert<int>(json['activityType']);
	if (activityType != null) {
		boardInfoDataActivitys.activityType = activityType;
	}
	final int? idx = jsonConvert.convert<int>(json['idx']);
	if (idx != null) {
		boardInfoDataActivitys.idx = idx;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		boardInfoDataActivitys.createDate = createDate;
	}
	final String? updateDate = jsonConvert.convert<String>(json['updateDate']);
	if (updateDate != null) {
		boardInfoDataActivitys.updateDate = updateDate;
	}
	return boardInfoDataActivitys;
}

Map<String, dynamic> $BoardInfoDataActivitysToJson(BoardInfoDataActivitys entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['activityName'] = entity.activityName;
	data['activityText'] = entity.activityText;
	data['activityUrl'] = entity.activityUrl;
	data['imgUrl'] = entity.imgUrl;
	data['activityType'] = entity.activityType;
	data['idx'] = entity.idx;
	data['createDate'] = entity.createDate;
	data['updateDate'] = entity.updateDate;
	return data;
}

BoardInfoDataBanner $BoardInfoDataBannerFromJson(Map<String, dynamic> json) {
	final BoardInfoDataBanner boardInfoDataBanner = BoardInfoDataBanner();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		boardInfoDataBanner.id = id;
	}
	final String? bannerName = jsonConvert.convert<String>(json['bannerName']);
	if (bannerName != null) {
		boardInfoDataBanner.bannerName = bannerName;
	}
	final String? bannerText = jsonConvert.convert<String>(json['bannerText']);
	if (bannerText != null) {
		boardInfoDataBanner.bannerText = bannerText;
	}
	final String? bannerImg = jsonConvert.convert<String>(json['bannerImg']);
	if (bannerImg != null) {
		boardInfoDataBanner.bannerImg = bannerImg;
	}
	final String? bannerUrl = jsonConvert.convert<String>(json['bannerUrl']);
	if (bannerUrl != null) {
		boardInfoDataBanner.bannerUrl = bannerUrl;
	}
	return boardInfoDataBanner;
}

Map<String, dynamic> $BoardInfoDataBannerToJson(BoardInfoDataBanner entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['bannerName'] = entity.bannerName;
	data['bannerText'] = entity.bannerText;
	data['bannerImg'] = entity.bannerImg;
	data['bannerUrl'] = entity.bannerUrl;
	return data;
}

BoardInfoDataBangdan $BoardInfoDataBangdanFromJson(Map<String, dynamic> json) {
	final BoardInfoDataBangdan boardInfoDataBangdan = BoardInfoDataBangdan();
	final int? showCount = jsonConvert.convert<int>(json['showCount']);
	if (showCount != null) {
		boardInfoDataBangdan.showCount = showCount;
	}
	final int? flag = jsonConvert.convert<int>(json['flag']);
	if (flag != null) {
		boardInfoDataBangdan.flag = flag;
	}
	final String? actionUrl = jsonConvert.convert<String>(json['actionUrl']);
	if (actionUrl != null) {
		boardInfoDataBangdan.actionUrl = actionUrl;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		boardInfoDataBangdan.name = name;
	}
	final int? xShow = jsonConvert.convert<int>(json['show']);
	if (xShow != null) {
		boardInfoDataBangdan.xShow = xShow;
	}
	final int? index = jsonConvert.convert<int>(json['index']);
	if (index != null) {
		boardInfoDataBangdan.index = index;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		boardInfoDataBangdan.id = id;
	}
	final int? idx = jsonConvert.convert<int>(json['idx']);
	if (idx != null) {
		boardInfoDataBangdan.idx = idx;
	}
	final List<BoardInfoDataBangdanList>? list = jsonConvert.convertListNotNull<BoardInfoDataBangdanList>(json['list']);
	if (list != null) {
		boardInfoDataBangdan.list = list;
	}
	final int? showPropertyType = jsonConvert.convert<int>(json['showPropertyType']);
	if (showPropertyType != null) {
		boardInfoDataBangdan.showPropertyType = showPropertyType;
	}
	final String? actionName = jsonConvert.convert<String>(json['actionName']);
	if (actionName != null) {
		boardInfoDataBangdan.actionName = actionName;
	}
	final String? nameText = jsonConvert.convert<String>(json['nameText']);
	if (nameText != null) {
		boardInfoDataBangdan.nameText = nameText;
	}
	return boardInfoDataBangdan;
}

Map<String, dynamic> $BoardInfoDataBangdanToJson(BoardInfoDataBangdan entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['showCount'] = entity.showCount;
	data['flag'] = entity.flag;
	data['actionUrl'] = entity.actionUrl;
	data['name'] = entity.name;
	data['show'] = entity.xShow;
	data['index'] = entity.index;
	data['id'] = entity.id;
	data['idx'] = entity.idx;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	data['showPropertyType'] = entity.showPropertyType;
	data['actionName'] = entity.actionName;
	data['nameText'] = entity.nameText;
	return data;
}

BoardInfoDataBangdanList $BoardInfoDataBangdanListFromJson(Map<String, dynamic> json) {
	final BoardInfoDataBangdanList boardInfoDataBangdanList = BoardInfoDataBangdanList();
	final String? categoryColor = jsonConvert.convert<String>(json['categoryColor']);
	if (categoryColor != null) {
		boardInfoDataBangdanList.categoryColor = categoryColor;
	}
	final String? wordCount = jsonConvert.convert<String>(json['wordCount']);
	if (wordCount != null) {
		boardInfoDataBangdanList.wordCount = wordCount;
	}
	final int? categoryThr = jsonConvert.convert<int>(json['categoryThr']);
	if (categoryThr != null) {
		boardInfoDataBangdanList.categoryThr = categoryThr;
	}
	final String? categoryName = jsonConvert.convert<String>(json['categoryName']);
	if (categoryName != null) {
		boardInfoDataBangdanList.categoryName = categoryName;
	}
	final String? bookid = jsonConvert.convert<String>(json['bookid']);
	if (bookid != null) {
		boardInfoDataBangdanList.bookid = bookid;
	}
	final List<BoardInfoDataBangdanListTags>? tags = jsonConvert.convertListNotNull<BoardInfoDataBangdanListTags>(json['tags']);
	if (tags != null) {
		boardInfoDataBangdanList.tags = tags;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		boardInfoDataBangdanList.cover = cover;
	}
	final String? bookStatue = jsonConvert.convert<String>(json['bookStatue']);
	if (bookStatue != null) {
		boardInfoDataBangdanList.bookStatue = bookStatue;
	}
	final String? newBookName = jsonConvert.convert<String>(json['newBookName']);
	if (newBookName != null) {
		boardInfoDataBangdanList.newBookName = newBookName;
	}
	final String? authorName = jsonConvert.convert<String>(json['authorName']);
	if (authorName != null) {
		boardInfoDataBangdanList.authorName = authorName;
	}
	final String? grade = jsonConvert.convert<String>(json['grade']);
	if (grade != null) {
		boardInfoDataBangdanList.grade = grade;
	}
	final String? intro = jsonConvert.convert<String>(json['intro']);
	if (intro != null) {
		boardInfoDataBangdanList.intro = intro;
	}
	final String? popularity = jsonConvert.convert<String>(json['popularity']);
	if (popularity != null) {
		boardInfoDataBangdanList.popularity = popularity;
	}
	final String? online = jsonConvert.convert<String>(json['online']);
	if (online != null) {
		boardInfoDataBangdanList.online = online;
	}
	final int? categorySec = jsonConvert.convert<int>(json['categorySec']);
	if (categorySec != null) {
		boardInfoDataBangdanList.categorySec = categorySec;
	}
	return boardInfoDataBangdanList;
}

Map<String, dynamic> $BoardInfoDataBangdanListToJson(BoardInfoDataBangdanList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['categoryColor'] = entity.categoryColor;
	data['wordCount'] = entity.wordCount;
	data['categoryThr'] = entity.categoryThr;
	data['categoryName'] = entity.categoryName;
	data['bookid'] = entity.bookid;
	data['tags'] =  entity.tags?.map((v) => v.toJson()).toList();
	data['cover'] = entity.cover;
	data['bookStatue'] = entity.bookStatue;
	data['newBookName'] = entity.newBookName;
	data['authorName'] = entity.authorName;
	data['grade'] = entity.grade;
	data['intro'] = entity.intro;
	data['popularity'] = entity.popularity;
	data['online'] = entity.online;
	data['categorySec'] = entity.categorySec;
	return data;
}

BoardInfoDataBangdanListTags $BoardInfoDataBangdanListTagsFromJson(Map<String, dynamic> json) {
	final BoardInfoDataBangdanListTags boardInfoDataBangdanListTags = BoardInfoDataBangdanListTags();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		boardInfoDataBangdanListTags.name = name;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		boardInfoDataBangdanListTags.id = id;
	}
	final int? hot = jsonConvert.convert<int>(json['hot']);
	if (hot != null) {
		boardInfoDataBangdanListTags.hot = hot;
	}
	return boardInfoDataBangdanListTags;
}

Map<String, dynamic> $BoardInfoDataBangdanListTagsToJson(BoardInfoDataBangdanListTags entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['hot'] = entity.hot;
	return data;
}

BoardInfoDataTags $BoardInfoDataTagsFromJson(Map<String, dynamic> json) {
	final BoardInfoDataTags boardInfoDataTags = BoardInfoDataTags();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		boardInfoDataTags.id = id;
	}
	final String? tagName = jsonConvert.convert<String>(json['tagName']);
	if (tagName != null) {
		boardInfoDataTags.tagName = tagName;
	}
	final String? tagText = jsonConvert.convert<String>(json['tagText']);
	if (tagText != null) {
		boardInfoDataTags.tagText = tagText;
	}
	final String? tagUrl = jsonConvert.convert<String>(json['tagUrl']);
	if (tagUrl != null) {
		boardInfoDataTags.tagUrl = tagUrl;
	}
	final String? imgUrl = jsonConvert.convert<String>(json['imgUrl']);
	if (imgUrl != null) {
		boardInfoDataTags.imgUrl = imgUrl;
	}
	final int? tagType = jsonConvert.convert<int>(json['tagType']);
	if (tagType != null) {
		boardInfoDataTags.tagType = tagType;
	}
	final int? idx = jsonConvert.convert<int>(json['idx']);
	if (idx != null) {
		boardInfoDataTags.idx = idx;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		boardInfoDataTags.createDate = createDate;
	}
	final String? updateDate = jsonConvert.convert<String>(json['updateDate']);
	if (updateDate != null) {
		boardInfoDataTags.updateDate = updateDate;
	}
	return boardInfoDataTags;
}

Map<String, dynamic> $BoardInfoDataTagsToJson(BoardInfoDataTags entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['tagName'] = entity.tagName;
	data['tagText'] = entity.tagText;
	data['tagUrl'] = entity.tagUrl;
	data['imgUrl'] = entity.imgUrl;
	data['tagType'] = entity.tagType;
	data['idx'] = entity.idx;
	data['createDate'] = entity.createDate;
	data['updateDate'] = entity.updateDate;
	return data;
}