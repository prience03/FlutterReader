import 'package:flutter_project/db/sp_cache.dart';
import 'package:flutter_project/http/core/f_net.dart';
import 'package:flutter_project/http/request/categoty_request.dart';
import 'package:flutter_project/http/request/competive_tab_request.dart';
import 'package:flutter_project/http/request/project_request.dart';
import 'package:flutter_project/http/request/project_tab_request.dart';
import 'package:flutter_project/model/category/category_model.dart';
import 'package:flutter_project/model/competive/board_info_entity.dart';
import 'package:flutter_project/model/competive/competive_tab_entity.dart';
import 'package:flutter_project/model/project/project_model.dart';
import 'package:flutter_project/model/project/project_tab_model.dart';

class ProjectDao {
  ///项目模块 上方tab请求
  static getCreadTab() async {
    String userID = SpCache.getInstance()!.get("userId") as String;
    CompetiveTabRequest request =
        CompetiveTabRequest(paths: "cx/index/getConfigList");
    request.add("uid", userID);
    request.add("uuid", "6e80217069a3b01eb1dddd0f0f4e4bc1");
    request.add("cnid", "2345");
    request.add("version", "7.9.6");
    request.add("packname", "com.mianfeizs.book");
    request.add("platform", "android");
    request.add("timestamp", "1647419413493");
    request.add("token", "efb110a611d653d9c0f12f76fc22ad93");
    request.add("SensorsId", "b22cff3f89f971f5");
    request.add("preference", "2");
    request.add("appname", "mfzs");
    request.add("appName", "mfzs");
    request.add("platform", "android");
    request.add("channelId", "2345");
    request.add("vcode", "168");
    request.add("vercode", "168");
    request.add("version", "7.9.7");

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
    int code = result['code'];
    CompetiveTabEntity? competiveTabEntity;
    if (code == 0) {
      competiveTabEntity = CompetiveTabEntity.fromJson(result);
    }
    return competiveTabEntity!.data;
  }

  ///根据tab的cid分页请求项目模块数据
  static getCreadFromTab(
      int pagePos, int cid, int tagType, int tagPlace) async {
    Object? userID = SpCache.getInstance()!.get("userId");
    CompetiveTabRequest request =
        CompetiveTabRequest(paths: "/cx/index/getConfigItems");
    request.add("uid", userID.toString());
    request.add("uuid", "6e80217069a3b01eb1dddd0f0f4e4bc1");
    request.add("cnid", "2345");
    request.add("version", "7.9.6");
    request.add("packname", "com.mianfeizs.book");
    request.add("platform", "android");
    request.add("timestamp", "1647419413493");
    request.add("token", "efb110a611d653d9c0f12f76fc22ad93");
    request.add("SensorsId", "b22cff3f89f971f5");
    request.add("preference", "2");
    request.add("appname", "mfzs");
    request.add("appName", "mfzs");
    request.add("platform", "android");
    request.add("channelId", "2345");
    request.add("vcode", "168");
    request.add("vercode", "168");
    request.add("version", "7.9.7");

    request.add("tagId", cid);
    if (tagType != 1) {
      request.add("curpage", pagePos);
    } else {
      if (tagPlace == -1) {
        tagPlace = 0;
      }
      request.add("type", tagPlace);
    }

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
    int code = result['code'];
    BoardInfoEntity? boardInfoEntity;
    if (code == 0) {
      boardInfoEntity = BoardInfoEntity.fromJson(result);
    }
    return boardInfoEntity?.data;
  }

  ///项目模块 上方tab请求
  static getTab() async {
    ProjectTabRequest request = ProjectTabRequest();
    var result = await FNet.getInstance().fire(request);
    List tabList = result['data'];
    List<ProjectTabModel> list = tabList.map((e) {
      return new ProjectTabModel.fromJson(e);
    }).toList();

    return list;
  }

  ///根据tab的cid分页请求项目模块数据
  static getProjectFromTab(int pagePos, int cid) async {
    ProjectRequest request = ProjectRequest();
    request.pathParams = "$pagePos/json";
    request.add("cid", cid);
    var result = await FNet.getInstance().fire(request);
    return ProjectModel.fromJson(result['data']);
  }

  ///获取文章体系
  static getCategory() async {
    CategoryRequest request = CategoryRequest();
    var result = await FNet.getInstance().fire(request);
    List list = result['data'];
    List<CategoryModel> categoryList = list.map((e) {
      return CategoryModel.fromJson(e);
    }).toList();
    return categoryList;
  }
}
