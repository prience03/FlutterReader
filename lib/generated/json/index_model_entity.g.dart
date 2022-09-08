import 'package:flutter_project/generated/json/base/json_convert_content.dart';
import 'package:flutter_project/model/main/index_model_entity.dart';

IndexModelEntity $IndexModelEntityFromJson(Map<String, dynamic> json) {
	final IndexModelEntity indexModelEntity = IndexModelEntity();
	final List<dynamic>? defaultBooklist = jsonConvert.convertListNotNull<dynamic>(json['defaultBooklist']);
	if (defaultBooklist != null) {
		indexModelEntity.defaultBooklist = defaultBooklist;
	}
	final List<IndexModelData>? data = jsonConvert.convertListNotNull<IndexModelData>(json['data']);
	if (data != null) {
		indexModelEntity.data = data;
	}
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		indexModelEntity.code = code;
	}
	final String? festivalActivities = jsonConvert.convert<String>(json['festivalActivities']);
	if (festivalActivities != null) {
		indexModelEntity.festivalActivities = festivalActivities;
	}
	final IndexModelUser? user = jsonConvert.convert<IndexModelUser>(json['user']);
	if (user != null) {
		indexModelEntity.user = user;
	}
	final List<String>? hotWords = jsonConvert.convertListNotNull<String>(json['hotWords']);
	if (hotWords != null) {
		indexModelEntity.hotWords = hotWords;
	}
	final int? intervalTime = jsonConvert.convert<int>(json['intervalTime']);
	if (intervalTime != null) {
		indexModelEntity.intervalTime = intervalTime;
	}
	return indexModelEntity;
}

Map<String, dynamic> $IndexModelEntityToJson(IndexModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['defaultBooklist'] =  entity.defaultBooklist;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	data['code'] = entity.code;
	data['festivalActivities'] = entity.festivalActivities;
	data['user'] = entity.user?.toJson();
	data['hotWords'] =  entity.hotWords;
	data['intervalTime'] = entity.intervalTime;
	return data;
}

IndexModelData $IndexModelDataFromJson(Map<String, dynamic> json) {
	final IndexModelData indexModelData = IndexModelData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		indexModelData.id = id;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		indexModelData.icon = icon;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		indexModelData.name = name;
	}
	final int? isNotice = jsonConvert.convert<int>(json['isNotice']);
	if (isNotice != null) {
		indexModelData.isNotice = isNotice;
	}
	final String? tips = jsonConvert.convert<String>(json['tips']);
	if (tips != null) {
		indexModelData.tips = tips;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		indexModelData.url = url;
	}
	return indexModelData;
}

Map<String, dynamic> $IndexModelDataToJson(IndexModelData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['icon'] = entity.icon;
	data['name'] = entity.name;
	data['isNotice'] = entity.isNotice;
	data['tips'] = entity.tips;
	data['url'] = entity.url;
	return data;
}

IndexModelUser $IndexModelUserFromJson(Map<String, dynamic> json) {
	final IndexModelUser indexModelUser = IndexModelUser();
	final String? mfxsClientid = jsonConvert.convert<String>(json['mfxs_clientid']);
	if (mfxsClientid != null) {
		indexModelUser.mfxsClientid = mfxsClientid;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		indexModelUser.createTime = createTime;
	}
	final int? sex = jsonConvert.convert<int>(json['sex']);
	if (sex != null) {
		indexModelUser.sex = sex;
	}
	final int? isVip = jsonConvert.convert<int>(json['isVip']);
	if (isVip != null) {
		indexModelUser.isVip = isVip;
	}
	final int? payVipDate = jsonConvert.convert<int>(json['payVipDate']);
	if (payVipDate != null) {
		indexModelUser.payVipDate = payVipDate;
	}
	final String? tel = jsonConvert.convert<String>(json['tel']);
	if (tel != null) {
		indexModelUser.tel = tel;
	}
	final bool? cowCardVip = jsonConvert.convert<bool>(json['cowCardVip']);
	if (cowCardVip != null) {
		indexModelUser.cowCardVip = cowCardVip;
	}
	final int? inteDouble = jsonConvert.convert<int>(json['inteDouble']);
	if (inteDouble != null) {
		indexModelUser.inteDouble = inteDouble;
	}
	final int? integral = jsonConvert.convert<int>(json['integral']);
	if (integral != null) {
		indexModelUser.integral = integral;
	}
	final int? chargeVipDate = jsonConvert.convert<int>(json['chargeVipDate']);
	if (chargeVipDate != null) {
		indexModelUser.chargeVipDate = chargeVipDate;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		indexModelUser.id = id;
	}
	final String? nickName = jsonConvert.convert<String>(json['nickName']);
	if (nickName != null) {
		indexModelUser.nickName = nickName;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		indexModelUser.name = name;
	}
	final int? showRedEnvelopeForm = jsonConvert.convert<int>(json['showRedEnvelopeForm']);
	if (showRedEnvelopeForm != null) {
		indexModelUser.showRedEnvelopeForm = showRedEnvelopeForm;
	}
	final int? products = jsonConvert.convert<int>(json['products']);
	if (products != null) {
		indexModelUser.products = products;
	}
	final String? lastLoginTime = jsonConvert.convert<String>(json['lastLoginTime']);
	if (lastLoginTime != null) {
		indexModelUser.lastLoginTime = lastLoginTime;
	}
	final int? loginNumSum = jsonConvert.convert<int>(json['login_num_sum']);
	if (loginNumSum != null) {
		indexModelUser.loginNumSum = loginNumSum;
	}
	final String? oaid = jsonConvert.convert<String>(json['oaid']);
	if (oaid != null) {
		indexModelUser.oaid = oaid;
	}
	final String? lastCreateChannel = jsonConvert.convert<String>(json['lastCreateChannel']);
	if (lastCreateChannel != null) {
		indexModelUser.lastCreateChannel = lastCreateChannel;
	}
	final String? logo = jsonConvert.convert<String>(json['logo']);
	if (logo != null) {
		indexModelUser.logo = logo;
	}
	final int? topShieldAd = jsonConvert.convert<int>(json['topShieldAd']);
	if (topShieldAd != null) {
		indexModelUser.topShieldAd = topShieldAd;
	}
	final int? loginNum = jsonConvert.convert<int>(json['loginNum']);
	if (loginNum != null) {
		indexModelUser.loginNum = loginNum;
	}
	final int? isNew = jsonConvert.convert<int>(json['isNew']);
	if (isNew != null) {
		indexModelUser.isNew = isNew;
	}
	final String? imei = jsonConvert.convert<String>(json['imei']);
	if (imei != null) {
		indexModelUser.imei = imei;
	}
	final int? vipPopupStatus = jsonConvert.convert<int>(json['vipPopupStatus']);
	if (vipPopupStatus != null) {
		indexModelUser.vipPopupStatus = vipPopupStatus;
	}
	final int? vipRemainingDays = jsonConvert.convert<int>(json['vipRemainingDays']);
	if (vipRemainingDays != null) {
		indexModelUser.vipRemainingDays = vipRemainingDays;
	}
	final String? birthDay = jsonConvert.convert<String>(json['birthDay']);
	if (birthDay != null) {
		indexModelUser.birthDay = birthDay;
	}
	final String? lastLoginVersion = jsonConvert.convert<String>(json['lastLoginVersion']);
	if (lastLoginVersion != null) {
		indexModelUser.lastLoginVersion = lastLoginVersion;
	}
	final int? currentTime = jsonConvert.convert<int>(json['currentTime']);
	if (currentTime != null) {
		indexModelUser.currentTime = currentTime;
	}
	final int? lastCreateTime = jsonConvert.convert<int>(json['lastCreateTime']);
	if (lastCreateTime != null) {
		indexModelUser.lastCreateTime = lastCreateTime;
	}
	final int? userGroup = jsonConvert.convert<int>(json['userGroup']);
	if (userGroup != null) {
		indexModelUser.userGroup = userGroup;
	}
	final String? uuid = jsonConvert.convert<String>(json['uuid']);
	if (uuid != null) {
		indexModelUser.uuid = uuid;
	}
	final int? shieldAd = jsonConvert.convert<int>(json['shieldAd']);
	if (shieldAd != null) {
		indexModelUser.shieldAd = shieldAd;
	}
	final int? isBind = jsonConvert.convert<int>(json['isBind']);
	if (isBind != null) {
		indexModelUser.isBind = isBind;
	}
	return indexModelUser;
}

Map<String, dynamic> $IndexModelUserToJson(IndexModelUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['mfxs_clientid'] = entity.mfxsClientid;
	data['createTime'] = entity.createTime;
	data['sex'] = entity.sex;
	data['isVip'] = entity.isVip;
	data['payVipDate'] = entity.payVipDate;
	data['tel'] = entity.tel;
	data['cowCardVip'] = entity.cowCardVip;
	data['inteDouble'] = entity.inteDouble;
	data['integral'] = entity.integral;
	data['chargeVipDate'] = entity.chargeVipDate;
	data['id'] = entity.id;
	data['nickName'] = entity.nickName;
	data['name'] = entity.name;
	data['showRedEnvelopeForm'] = entity.showRedEnvelopeForm;
	data['products'] = entity.products;
	data['lastLoginTime'] = entity.lastLoginTime;
	data['login_num_sum'] = entity.loginNumSum;
	data['oaid'] = entity.oaid;
	data['lastCreateChannel'] = entity.lastCreateChannel;
	data['logo'] = entity.logo;
	data['topShieldAd'] = entity.topShieldAd;
	data['loginNum'] = entity.loginNum;
	data['isNew'] = entity.isNew;
	data['imei'] = entity.imei;
	data['vipPopupStatus'] = entity.vipPopupStatus;
	data['vipRemainingDays'] = entity.vipRemainingDays;
	data['birthDay'] = entity.birthDay;
	data['lastLoginVersion'] = entity.lastLoginVersion;
	data['currentTime'] = entity.currentTime;
	data['lastCreateTime'] = entity.lastCreateTime;
	data['userGroup'] = entity.userGroup;
	data['uuid'] = entity.uuid;
	data['shieldAd'] = entity.shieldAd;
	data['isBind'] = entity.isBind;
	return data;
}