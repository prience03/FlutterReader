import 'package:flutter_project/http/request/base_request.dart';

///首页banner请求
///https://www.wanandroid.com/banner/json
class IndexRequest extends BaseRequest {

  @override
  bool get useHttps => false;

  @override
  String authority() {
    return "cxb-pro.cread.com";
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "cx/itf/mySidebar";
  }

  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

}
