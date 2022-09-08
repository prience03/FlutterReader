import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_project/http/request/base_request.dart';
import 'package:flutter_project/http/core/f_error.dart';
import 'package:flutter_project/http/core/f_net_adapter.dart';
import 'package:path_provider/path_provider.dart';


///适配Dio网络请求
///如果有其他网络库，则可以继承FNetAdapter重写。
class DioAdapter extends FNetAdapter {
  static PersistCookieJar? _cookieJar;

  static Future initCookJar() async{
    Directory? directory = await getApplicationDocumentsDirectory();
    _cookieJar = new PersistCookieJar(storage: FileStorage(directory.path));
  }

  @override
  Future<BaseNetResponse<T>> send<T>(BaseRequest request) async {
    Response? response ;
    var option = Options(headers: request.header);
    var error;

    try {
      var dio = Dio();
      // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      //   // config the http client
      //   client.findProxy = (uri) {
      //     //proxy all request to localhost:8888
      //     return "PROXY 192.168.8.101:8888"; //这里将localhost设置为自己电脑的IP，其他不变，注意上线的时候一定记得把代理去掉
      //   };
      //   // you can also create a HttpClient to dio
      //   // return HttpClient();
      // };
      if(_cookieJar==null){
        Directory? directory = await getApplicationDocumentsDirectory();
        _cookieJar = new PersistCookieJar(storage: FileStorage(directory.path));
      }
      dio.interceptors.add(CookieManager(_cookieJar!));

      if (request.httpMethod() == HttpMethod.GET) {
        print("${request.url()}");
        response = (await dio.get(request.url(), options: option)) ;
      } else if (request.httpMethod() == HttpMethod.POST) {
        print("${request.url()} ${request.params} $option");
        response =
        (await dio.post(request.url(), data: request.params, options: option)) ;
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = (await dio.delete(
            request.url(), data: request.params, options: option)) ;
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }

    if (error != null) {
      throw FNetError(response?.statusCode ??-1, error.toString(),data: await buildRes(response,request));
    }

    return buildRes(response, request);
  }

  ///BaseNetResponse
  Future<BaseNetResponse<T>> buildRes<T>(
      Response? response, BaseRequest request) {
    return Future.value(BaseNetResponse(
      //?.防止response为空
        data: response?.data,
        request: request,
        errorCode: response?.statusCode,
        errorMsg: response?.statusMessage,
        extra: response));
  }

}