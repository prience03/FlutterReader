import 'package:flutter_project/http/request/base_request.dart';

///首页banner请求
///https://www.wanandroid.com/banner/json
class ReaderContentRequest extends BaseRequest {


  String  customerPath  = "";

  ReaderContentRequest(String path) :customerPath = path;

  @override
  bool get useHttps => true;

  @override
  String authority() {
    return "readbook-service-freebook.cread.com";
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    if(customerPath.isNotEmpty){
      return customerPath;
    }
    return "cx/itf/chapterRead";
  }

  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

}
