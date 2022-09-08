
import 'package:flutter_project/app/server_api_code.dart';

/// 接口操作失败的异常
class ActionFailedException implements Exception {
  int? code;
  String? message;

  ActionFailedException(this.code, this.message);

  ActionFailedException.fromRespData(RespData respData) {
    code = respData.code;
    message = respData.message;
  }

  @override
  String toString() {
    return 'errorCode=$code,errorMsg=$message';
  }
}

/// 书币余额不足，需要跳转充值页面
class InsufficientBalanceException implements Exception {
  const InsufficientBalanceException();

  @override
  String toString() => 'InsufficientBalanceException';
}

class RespData {
  dynamic data;
  int? code;
  String? message;

  RespData({this.data, required this.code, required this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['errcode'] = code;
    map['errmsg'] = message;
    map['data'] = data;
    return map;
  }

  RespData.fromJson(Map<String, dynamic> map) {
    code = map['code'];
    message = map['message'];
    data = map['data'];
  }

  bool get succeeded => actionOk == code;
}


