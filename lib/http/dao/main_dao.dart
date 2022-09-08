
import 'package:flutter_project/http/core/f_net.dart';
import 'package:flutter_project/http/request/IndexRequest.dart';
import 'package:flutter_project/model/main/index_model_entity.dart';

class MainDao{


  static getUid() async {
    IndexRequest request = new IndexRequest();
    request.add("uid",  "121628377");
    request.add("uuid",  "6e80217069a3b01eb1dddd0f0f4e4bc1");
    request.add("cnid",  "2345");
    request.add("version",  "7.9.6");
    request.add("packname",  "com.mianfeizs.book");
    request.add("platform",  "android");
    request.add("timestamp", "1647419413493");
    request.add("token",  "efb110a611d653d9c0f12f76fc22ad93");
    request.add("SensorsId",  "b22cff3f89f971f5");
    request.add("preference",  "2");

    request.addHeader("uid", "12162837");
    request.addHeader("uuid", "6e80217069a3b01eb1dddd0f0f4e4bc1");
    request.addHeader("cnid", "2345");
    request.addHeader("version", "7.9.6");
    request.addHeader("umeng", "default");
    request.addHeader("packname", "com.mianfeizs.book");
    request.addHeader("oscode", "30");
    request.addHeader("vcode", "168");
    request.addHeader("other", "a");
    request.addHeader("channelId", "2345");
    request.addHeader("platform", "android");
    request.addHeader("preference", "2");
    request.addHeader("appname", "mfzs");
    request.addHeader("timestamp", "1647419413493");
    request.addHeader("token", "efb110a611d653d9c0f12f76fc22ad93");
    request.addHeader("SensorsId", "b22cff3f89f971f5");

    var result = await FNet.getInstance().fire(request);
    IndexModelEntity ? indexMode;
    var code  = result['code'];
    if(code == '0' ){
      indexMode = IndexModelEntity.fromJson(result);
    }
    return indexMode;
  }

}