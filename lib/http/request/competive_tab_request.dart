import 'base_request.dart';

class CompetiveTabRequest extends BaseRequest {

  String paths = "";

  CompetiveTabRequest({required this.paths}){
  }

  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  String authority() => "service-boutique-freebook.cread.com";

  @override
  bool needLogin() {
    return false;
  }

  @override
  bool get useHttps => false;

  @override
  String path() {
    return paths;
  }
}
