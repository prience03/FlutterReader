
import 'package:flutter_project/db/sp_cache.dart';

import '../../global.dart';

enum HttpMethod { GET, POST, DELETE }

///每个接口请求，继承该抽象类，
abstract class BaseRequest{
  var pathParams;
  var useHttps = true;

  //域名
  String authority() {
    return "www.wanandroid.com";
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    var pathStr = path();

    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }

    addHeader("uid", SpCache.getInstance()?.getString("userId") as String);
    addHeader("uuid", "6e80217069a3b01eb1dddd0f0f4e4bc1");
    addHeader("cnid", Global.getCnid());
    addHeader("version", Global.getVersionName());
    addHeader("vcode", Global.getVersionCode());
    addHeader("umeng", "default");
    addHeader("packname", "com.mianfeizs.book");
    addHeader("oscode", "30");
    addHeader("other", "a");
    addHeader("channelId", "2345");
    addHeader("platform", Global.getPlayform());
    addHeader("preference", "2");
    addHeader("appname", "mfzs");
    addHeader("timestamp", "1647419413493");
    addHeader("token", "efb110a611d653d9c0f12f76fc22ad93");
    if(needLogin()){
      //需要登录,请求头添加token
      //addHeader(LoginDao.LOGIN_TOKEN, LoginDao.getToken());
    }
    return uri.toString();
  }

  //是否需要登录
  bool needLogin();

  Map<String, String> params = Map();

  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  //添加header
  Map<String, dynamic> header = {};

  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
