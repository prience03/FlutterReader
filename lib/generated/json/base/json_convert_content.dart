// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_project/model/competive/board_info_entity.dart';
import 'package:flutter_project/model/competive/competive_tab_entity.dart';
import 'package:flutter_project/model/main/index_model_entity.dart';
import 'package:flutter_project/model/novel/chapter_content_entity.dart';
import 'package:flutter_project/model/novel/chapternew_entity.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(BoardInfoEntity).toString(): BoardInfoEntity.fromJson,
		(BoardInfoData).toString(): BoardInfoData.fromJson,
		(BoardInfoDataActivitys).toString(): BoardInfoDataActivitys.fromJson,
		(BoardInfoDataBanner).toString(): BoardInfoDataBanner.fromJson,
		(BoardInfoDataBangdan).toString(): BoardInfoDataBangdan.fromJson,
		(BoardInfoDataBangdanList).toString(): BoardInfoDataBangdanList.fromJson,
		(BoardInfoDataBangdanListTags).toString(): BoardInfoDataBangdanListTags.fromJson,
		(BoardInfoDataTags).toString(): BoardInfoDataTags.fromJson,
		(CompetiveTabEntity).toString(): CompetiveTabEntity.fromJson,
		(CompetiveTabData).toString(): CompetiveTabData.fromJson,
		(IndexModelEntity).toString(): IndexModelEntity.fromJson,
		(IndexModelData).toString(): IndexModelData.fromJson,
		(IndexModelUser).toString(): IndexModelUser.fromJson,
		(ChapterContentEntity).toString(): ChapterContentEntity.fromJson,
		(ChapterContentChapterList).toString(): ChapterContentChapterList.fromJson,
		(ChapternewEntity).toString(): ChapternewEntity.fromJson,
		(ChapternewList).toString(): ChapternewList.fromJson,
		(ChapternewListBookChapters).toString(): ChapternewListBookChapters.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<BoardInfoEntity>[] is M){
			return data.map<BoardInfoEntity>((Map<String, dynamic> e) => BoardInfoEntity.fromJson(e)).toList() as M;
		}
		if(<BoardInfoData>[] is M){
			return data.map<BoardInfoData>((Map<String, dynamic> e) => BoardInfoData.fromJson(e)).toList() as M;
		}
		if(<BoardInfoDataActivitys>[] is M){
			return data.map<BoardInfoDataActivitys>((Map<String, dynamic> e) => BoardInfoDataActivitys.fromJson(e)).toList() as M;
		}
		if(<BoardInfoDataBanner>[] is M){
			return data.map<BoardInfoDataBanner>((Map<String, dynamic> e) => BoardInfoDataBanner.fromJson(e)).toList() as M;
		}
		if(<BoardInfoDataBangdan>[] is M){
			return data.map<BoardInfoDataBangdan>((Map<String, dynamic> e) => BoardInfoDataBangdan.fromJson(e)).toList() as M;
		}
		if(<BoardInfoDataBangdanList>[] is M){
			return data.map<BoardInfoDataBangdanList>((Map<String, dynamic> e) => BoardInfoDataBangdanList.fromJson(e)).toList() as M;
		}
		if(<BoardInfoDataBangdanListTags>[] is M){
			return data.map<BoardInfoDataBangdanListTags>((Map<String, dynamic> e) => BoardInfoDataBangdanListTags.fromJson(e)).toList() as M;
		}
		if(<BoardInfoDataTags>[] is M){
			return data.map<BoardInfoDataTags>((Map<String, dynamic> e) => BoardInfoDataTags.fromJson(e)).toList() as M;
		}
		if(<CompetiveTabEntity>[] is M){
			return data.map<CompetiveTabEntity>((Map<String, dynamic> e) => CompetiveTabEntity.fromJson(e)).toList() as M;
		}
		if(<CompetiveTabData>[] is M){
			return data.map<CompetiveTabData>((Map<String, dynamic> e) => CompetiveTabData.fromJson(e)).toList() as M;
		}
		if(<IndexModelEntity>[] is M){
			return data.map<IndexModelEntity>((Map<String, dynamic> e) => IndexModelEntity.fromJson(e)).toList() as M;
		}
		if(<IndexModelData>[] is M){
			return data.map<IndexModelData>((Map<String, dynamic> e) => IndexModelData.fromJson(e)).toList() as M;
		}
		if(<IndexModelUser>[] is M){
			return data.map<IndexModelUser>((Map<String, dynamic> e) => IndexModelUser.fromJson(e)).toList() as M;
		}
		if(<ChapterContentEntity>[] is M){
			return data.map<ChapterContentEntity>((Map<String, dynamic> e) => ChapterContentEntity.fromJson(e)).toList() as M;
		}
		if(<ChapterContentChapterList>[] is M){
			return data.map<ChapterContentChapterList>((Map<String, dynamic> e) => ChapterContentChapterList.fromJson(e)).toList() as M;
		}
		if(<ChapternewEntity>[] is M){
			return data.map<ChapternewEntity>((Map<String, dynamic> e) => ChapternewEntity.fromJson(e)).toList() as M;
		}
		if(<ChapternewList>[] is M){
			return data.map<ChapternewList>((Map<String, dynamic> e) => ChapternewList.fromJson(e)).toList() as M;
		}
		if(<ChapternewListBookChapters>[] is M){
			return data.map<ChapternewListBookChapters>((Map<String, dynamic> e) => ChapternewListBookChapters.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}