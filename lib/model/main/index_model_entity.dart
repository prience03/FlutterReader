import 'dart:convert';
import 'package:flutter_project/generated/json/base/json_field.dart';
import 'package:flutter_project/generated/json/index_model_entity.g.dart';

@JsonSerializable()
class IndexModelEntity {

	List<dynamic>? defaultBooklist;
	List<IndexModelData>? data;
	String? code;
	String? festivalActivities;
	IndexModelUser? user;
	List<String>? hotWords;
	int? intervalTime;
  
  IndexModelEntity();

  factory IndexModelEntity.fromJson(Map<String, dynamic> json) => $IndexModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $IndexModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexModelData {

	int? id;
	String? icon;
	String? name;
	int? isNotice;
	String? tips;
	String? url;
  
  IndexModelData();

  factory IndexModelData.fromJson(Map<String, dynamic> json) => $IndexModelDataFromJson(json);

  Map<String, dynamic> toJson() => $IndexModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexModelUser {

	@JSONField(name: "mfxs_clientid")
	String? mfxsClientid;
	String? createTime;
	int? sex;
	int? isVip;
	int? payVipDate;
	String? tel;
	bool? cowCardVip;
	int? inteDouble;
	int? integral;
	int? chargeVipDate;
	int? id;
	String? nickName;
	String? name;
	int? showRedEnvelopeForm;
	int? products;
	String? lastLoginTime;
	@JSONField(name: "login_num_sum")
	int? loginNumSum;
	String? oaid;
	String? lastCreateChannel;
	String? logo;
	int? topShieldAd;
	int? loginNum;
	int? isNew;
	String? imei;
	int? vipPopupStatus;
	int? vipRemainingDays;
	String? birthDay;
	String? lastLoginVersion;
	int? currentTime;
	int? lastCreateTime;
	int? userGroup;
	String? uuid;
	int? shieldAd;
	int? isBind;
  
  IndexModelUser();

  factory IndexModelUser.fromJson(Map<String, dynamic> json) => $IndexModelUserFromJson(json);

  Map<String, dynamic> toJson() => $IndexModelUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}