import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/model/novel/chapternew_entity.dart';

ChapternewEntity $ChapternewEntityFromJson(Map<String, dynamic> json) {
	final ChapternewEntity chapternewEntity = ChapternewEntity();
	final String? errorCode = jsonConvert.convert<String>(json['error_code']);
	if (errorCode != null) {
		chapternewEntity.errorCode = errorCode;
	}
	final List<ChapternewList>? list = jsonConvert.convertListNotNull<ChapternewList>(json['list']);
	if (list != null) {
		chapternewEntity.list = list;
	}
	final int? date = jsonConvert.convert<int>(json['date']);
	if (date != null) {
		chapternewEntity.date = date;
	}
	return chapternewEntity;
}

Map<String, dynamic> $ChapternewEntityToJson(ChapternewEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['error_code'] = entity.errorCode;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	data['date'] = entity.date;
	return data;
}

ChapternewList $ChapternewListFromJson(Map<String, dynamic> json) {
	final ChapternewList chapternewList = ChapternewList();
	final List<ChapternewListBookChapters>? bookChapters = jsonConvert.convertListNotNull<ChapternewListBookChapters>(json['bookChapters']);
	if (bookChapters != null) {
		chapternewList.bookChapters = bookChapters;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		chapternewList.name = name;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		chapternewList.id = id;
	}
	final int? idx = jsonConvert.convert<int>(json['idx']);
	if (idx != null) {
		chapternewList.idx = idx;
	}
	final String? bookId = jsonConvert.convert<String>(json['bookId']);
	if (bookId != null) {
		chapternewList.bookId = bookId;
	}
	final int? buyout = jsonConvert.convert<int>(json['buyout']);
	if (buyout != null) {
		chapternewList.buyout = buyout;
	}
	final dynamic? code = jsonConvert.convert<dynamic>(json['code']);
	if (code != null) {
		chapternewList.code = code;
	}
	final dynamic? other = jsonConvert.convert<dynamic>(json['other']);
	if (other != null) {
		chapternewList.other = other;
	}
	final dynamic? cpVolumeId = jsonConvert.convert<dynamic>(json['cpVolumeId']);
	if (cpVolumeId != null) {
		chapternewList.cpVolumeId = cpVolumeId;
	}
	return chapternewList;
}

Map<String, dynamic> $ChapternewListToJson(ChapternewList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['bookChapters'] =  entity.bookChapters?.map((v) => v.toJson()).toList();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['idx'] = entity.idx;
	data['bookId'] = entity.bookId;
	data['buyout'] = entity.buyout;
	data['code'] = entity.code;
	data['other'] = entity.other;
	data['cpVolumeId'] = entity.cpVolumeId;
	return data;
}

ChapternewListBookChapters $ChapternewListBookChaptersFromJson(Map<String, dynamic> json) {
	final ChapternewListBookChapters chapternewListBookChapters = ChapternewListBookChapters();
	final int? mp3Time = jsonConvert.convert<int>(json['mp3Time']);
	if (mp3Time != null) {
		chapternewListBookChapters.mp3Time = mp3Time;
	}
	final String? updateDate = jsonConvert.convert<String>(json['updateDate']);
	if (updateDate != null) {
		chapternewListBookChapters.updateDate = updateDate;
	}
	final int? mp3Exist = jsonConvert.convert<int>(json['mp3Exist']);
	if (mp3Exist != null) {
		chapternewListBookChapters.mp3Exist = mp3Exist;
	}
	final String? mp3CreateDate = jsonConvert.convert<String>(json['mp3CreateDate']);
	if (mp3CreateDate != null) {
		chapternewListBookChapters.mp3CreateDate = mp3CreateDate;
	}
	final int? chapterindex = jsonConvert.convert<int>(json['chapterindex']);
	if (chapterindex != null) {
		chapternewListBookChapters.chapterindex = chapterindex;
	}
	final int? wordCount = jsonConvert.convert<int>(json['wordCount']);
	if (wordCount != null) {
		chapternewListBookChapters.wordCount = wordCount;
	}
	final String? cdnUrl = jsonConvert.convert<String>(json['cdnUrl']);
	if (cdnUrl != null) {
		chapternewListBookChapters.cdnUrl = cdnUrl;
	}
	final int? contentstatus = jsonConvert.convert<int>(json['contentstatus']);
	if (contentstatus != null) {
		chapternewListBookChapters.contentstatus = contentstatus;
	}
	final int? s3exist = jsonConvert.convert<int>(json['s3exist']);
	if (s3exist != null) {
		chapternewListBookChapters.s3exist = s3exist;
	}
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		chapternewListBookChapters.version = version;
	}
	final String? isVip = jsonConvert.convert<String>(json['isVip']);
	if (isVip != null) {
		chapternewListBookChapters.isVip = isVip;
	}
	final String? bookid = jsonConvert.convert<String>(json['bookid']);
	if (bookid != null) {
		chapternewListBookChapters.bookid = bookid;
	}
	final String? mp3Path = jsonConvert.convert<String>(json['mp3Path']);
	if (mp3Path != null) {
		chapternewListBookChapters.mp3Path = mp3Path;
	}
	final int? mp3Sex = jsonConvert.convert<int>(json['mp3Sex']);
	if (mp3Sex != null) {
		chapternewListBookChapters.mp3Sex = mp3Sex;
	}
	final int? volumeId = jsonConvert.convert<int>(json['volumeId']);
	if (volumeId != null) {
		chapternewListBookChapters.volumeId = volumeId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		chapternewListBookChapters.name = name;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		chapternewListBookChapters.id = id;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		chapternewListBookChapters.status = status;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		chapternewListBookChapters.createDate = createDate;
	}
	final int? idx = jsonConvert.convert<int>(json['idx']);
	if (idx != null) {
		chapternewListBookChapters.idx = idx;
	}
	final dynamic? chapterNum = jsonConvert.convert<dynamic>(json['chapterNum']);
	if (chapterNum != null) {
		chapternewListBookChapters.chapterNum = chapterNum;
	}
	final dynamic? charge = jsonConvert.convert<dynamic>(json['charge']);
	if (charge != null) {
		chapternewListBookChapters.charge = charge;
	}
	final dynamic? cpautoid = jsonConvert.convert<dynamic>(json['cpautoid']);
	if (cpautoid != null) {
		chapternewListBookChapters.cpautoid = cpautoid;
	}
	return chapternewListBookChapters;
}

Map<String, dynamic> $ChapternewListBookChaptersToJson(ChapternewListBookChapters entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['mp3Time'] = entity.mp3Time;
	data['updateDate'] = entity.updateDate;
	data['mp3Exist'] = entity.mp3Exist;
	data['mp3CreateDate'] = entity.mp3CreateDate;
	data['chapterindex'] = entity.chapterindex;
	data['wordCount'] = entity.wordCount;
	data['cdnUrl'] = entity.cdnUrl;
	data['contentstatus'] = entity.contentstatus;
	data['s3exist'] = entity.s3exist;
	data['version'] = entity.version;
	data['isVip'] = entity.isVip;
	data['bookid'] = entity.bookid;
	data['mp3Path'] = entity.mp3Path;
	data['mp3Sex'] = entity.mp3Sex;
	data['volumeId'] = entity.volumeId;
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['status'] = entity.status;
	data['createDate'] = entity.createDate;
	data['idx'] = entity.idx;
	data['chapterNum'] = entity.chapterNum;
	data['charge'] = entity.charge;
	data['cpautoid'] = entity.cpautoid;
	return data;
}