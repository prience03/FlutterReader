
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/book/book_detail.dart';
import 'package:flutter_project/db/sp_cache.dart';
import 'package:flutter_project/http/core/dio_adapter.dart';
import 'package:isolate/isolate.dart';
import 'package:path_provider/path_provider.dart';

import 'generated/l10n.dart';
import 'model/competive/board_info_entity.dart';
import 'page/about_page.dart';

class Global {

  Global._() {
    init();
  }
  static Global? _instance;

  static Future<Global?> preInit() async {
    if (_instance == null) {
      String ids = await getUniqueId();
      await DioAdapter.initCookJar();
      _instance = Global._();
    }
    return _instance;
  }

  static bool checkLogin({BuildContext? context}) {
    var userId = SpCache.getInstance()!.getObject("userId");
    // if (userId == null && context != null) {
      // var content = Text(
      //   S.of(context).notYetLoginMsg(PlatformUtil.getOperatingSystem()),
      //   style: Theme.of(context).textTheme.subtitle1,
      // );
      // var positiveText = Text(
      //   S.of(context).ok,
      //   style: Theme.of(context)
      //       .textTheme
      //       .button!
      //       .copyWith(color: Theme.of(context).colorScheme.secondary),
      // );
      // onPositiveTap() {
      //   Navigator.pop(context);
      //   return MyRouter.showLoginOptions(context);
      // }

      // platformizations.showAlertDialog(
      //     context: context,
      //     content: content,
      //     positiveText: positiveText,
      //     onPositiveTap: onPositiveTap);
    // }
    return userId == null;
  }



  void init() {
      cnid = "2345";
      versionName = "8.0.6";
      versionCode = "186";
      packName = "com.mianfeizs.book";
      platform = Platform.isAndroid?"android":"else";
  }
  Future<LoadBalancer> loadBalancer = LoadBalancer.create(2, IsolateRunner.spawn);

  void testBalancer() async {
    final lb = await loadBalancer;
    int res = await lb.run(doWork, 110);
    print(res);
  }

  int doWork(int value) {
// 模拟耗时5秒
    print("new isolate doWork start");
    sleep(Duration(seconds: 5));
    return value;
  }


  static Future<String> getUniqueId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      print("ios唯一设备码："+iosDeviceInfo.identifierForVendor);
      SpCache.getInstance()?.setString(SpCache.KEY_SERIALID, iosDeviceInfo.identifierForVendor);
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print("android唯一设备码："+androidDeviceInfo.androidId);
      SpCache.getInstance()?.setString(SpCache.KEY_SERIALID, androidDeviceInfo.androidId);
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  static String ? cnid;
  static String ? versionName;
  static String ? versionCode;
  static String ? packName;
  static String ? platform;
  static String ? appname;

  static String getCnid(){
    return cnid!;
  }
  static String getVersionName(){
    return versionName!;
  }
  static String getVersionCode(){
    return versionCode!;
  }
  static String getPackName(){
    return packName!;
  }
  static String getPlayform(){
    return platform!;
  }
  static String getAppName(){
    return appname!;
  }
}




class MyRouter {
  static Route<dynamic> generateRoute({required RouteSettings settings,}) {
    print("MyRouter  ---->>>>>  $settings.name");
    switch (settings.name) {
      case RouteName.bookDetail:
        var book = settings.arguments as BoardInfoDataBangdanList;
        return CupertinoPageRoute(builder: (_) => BookDetailPage(book: book));
      // case RouteName.bookDetail:
      //   var book = settings.arguments as BoardInfoDataBangdanList;
      //   return CupertinoPageRoute(builder: (_) => BookDetailPage(book: book));
      // case RouteName.wallet:
      //   return CupertinoPageRoute(builder: (_) => const WalletPage());
      // case RouteName.editBookTypePrefs:
      //   return CupertinoPageRoute(
      //       builder: (_) => const EditBookTypePrefsPage());
      // case RouteName.readerPrefs:
      //   return CupertinoPageRoute(builder: (_) => const ReaderPrefs());
      // case RouteName.bookList:
      //   var args = settings.arguments as List;
      //   var value = args[0];
      //   var title = args[1];
      //   return CupertinoPageRoute(
      //     builder: (_) => BookListPage(value: value, title: title),
      //   );
      // case RouteName.editBookshelf:
      //   return CupertinoPageRoute(builder: (_) => const EditBookshelfPage());
      // case RouteName.catalog:
      //   var book = settings.arguments as Book;
      //   return CupertinoPageRoute(
      //     builder: (_) => CatalogPage(book: book),
      //   );
      // case RouteName.reader:
      //   var args = settings.arguments as List;
      //   Book book = args[0];
      //   Chapter chapter = args[1];
      //   return MaterialPageRoute(
      //     builder: (_) => ReaderScene(book: book, chapter: chapter),
      //   );
      // case RouteName.discovery:
      //   return CupertinoPageRoute(builder: (_) => const DiscoveryPage());
      // case RouteName.checkIn:
      //   var args =
      //   settings.arguments == null ? null : settings.arguments as Incentive;
      //   return CupertinoPageRoute(
      //     builder: (_) => CheckInPage(incentive: args),
      //   );
      case RouteName.about:
        return CupertinoPageRoute(builder: (_) => const AboutPage());
      // case RouteName.general:
      //   return CupertinoPageRoute(builder: (_) => const GeneralPage());
      // case RouteName.chooseGender:
      //   return CupertinoPageRoute(builder: (_) => const ChooseGenderPage());
      // case RouteName.editNickname:
      //   return CupertinoPageRoute(builder: (_) => const EditNicknamePage());
      // case RouteName.userProfile:
      //   return CupertinoPageRoute(builder: (_) => const UserProfilePage());
      // case RouteName.settings:
      //   return CupertinoPageRoute(builder: (_) => const SettingsPage());
      // case RouteName.help:
      //   return CupertinoPageRoute(builder: (_) => const HelpPage());
      // case RouteName.mine:
      //   return CupertinoPageRoute(builder: (_) => const MinePage());
      // case RouteName.chooseReadingPrefs:
      //   return CupertinoPageRoute(builder: (_) => ChooseReadingPrefsPage());
      // case RouteName.signIn:
      //   return NoAnimRouteBuilder<bool>(
      //       page: const SignInPage(), settings: settings);
      // case RouteName.text:
      //   var args = settings.arguments as List;
      //   String title = args[0];
      //   String body = args[1];
      //   return CupertinoPageRoute(
      //       builder: (_) => TextPage(title: title, body: body));
      // case RouteName.image:
      //   var arg = settings.arguments as String;
      //   return CupertinoPageRoute(
      //     builder: (_) => ImagePage(imageUrl: arg),
      //     settings: settings,
      //   );
      // case RouteName.web:
      //   var args = settings.arguments as List;
      //   return CupertinoPageRoute(
      //     builder: (_) => WebPage(url: args[0], title: args[1]),
      //     settings: settings,
      //   );
      // case RouteName.home:
      //   return NoAnimRouteBuilder(page: const HomePage(), settings: settings);
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  // static Future<bool?> showLoginOptions(BuildContext context) async {
  //   bool? result = await Navigator.push<bool>(
  //       context,
  //       MaterialPageRoute<bool>(
  //         builder: (_) => const SignInPage(),
  //       ));
  //   return Future.value(result);
  // }
}


class RouteName {
  static const String bookshelf = 'bookshelf';
  static const String bookstore = 'bookstore';
  static const String discovery = 'discovery';
  static const String bookDetail = 'bookDetail2';
  static const String chooseReadingPrefs = 'chooseReadingPrefs';
  static const String catalog = 'catalog';
  static const String reader = 'reader';
  static const String checkIn = 'checkIn';
  static const String bookList = 'bookList';
  static const String editBookshelf = 'editBookshelf';
  static const String editBookTypePrefs = 'editBookTypePrefs';
  static const String readerPrefs = 'readerPrefs';
  static const String wallet = 'wallet';
  static const String notices = 'notices';
  static const String search = 'search';
  static const String about = 'about';
  static const String general = 'general';
  static const String chooseGender = 'chooseGender';
  static const String editNickname = 'editNickname';
  static const String userProfile = 'userProfile';
  static const String settings = 'settings';
  static const String help = 'help';
  static const String mine = 'mine';
  static const String image = 'image';
  static const String web = 'web';
  static const String text = 'text';
  static const String signIn = 'signIn';
  static const String home = '/'; // 主页默认为 “/”
}


