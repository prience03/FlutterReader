import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/book/book_detail.dart';
import 'package:flutter_project/db/sp_cache.dart';
import 'package:flutter_project/global.dart';
import 'package:flutter_project/http/dao/main_dao.dart';
import 'package:flutter_project/model/competive/board_info_entity.dart';
import 'package:flutter_project/model/main/index_model_entity.dart';
import 'package:flutter_project/navigator/bottom_navigator.dart';
import 'package:flutter_project/navigator/f_navigatior.dart';
import 'package:flutter_project/page/about_page.dart';
import 'package:flutter_project/page/article_page.dart';
import 'package:flutter_project/page/coin_rank_page.dart';
import 'package:flutter_project/page/login_page.dart';
import 'package:flutter_project/page/my_collect_page.dart';
import 'package:flutter_project/page/register_page.dart';
import 'package:flutter_project/page/setting_page.dart';
import 'package:flutter_project/page/video_detail_page.dart';
import 'package:flutter_project/page/webview_page.dart';
import 'package:flutter_project/provider/provider_manager.dart';
import 'package:flutter_project/provider/theme_provider.dart';
import 'package:flutter_project/utils/toast_util.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'http/core/dio_adapter.dart';
import 'http/core/f_error.dart';
import 'model/video_model.dart';
import 'reader/reader_scene.dart';

void main() {
  runApp(FApp());
}

class FApp extends StatefulWidget {
  const FApp({Key? key}) : super(key: key);

  @override
  _FAppState createState() => _FAppState();
}

class _FAppState extends State<FApp> {
  FRouteDelegate _routeDelegate = FRouteDelegate();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MyRouter.generateRoute(settings: settings);
  }
  @override
  Widget build(BuildContext context) {
    DioAdapter.initCookJar();
    Global.preInit();
    _loadUidData();
    return FutureBuilder<SpCache?>(
        key: Key("Main"),
        future: SpCache.preInit(),
        builder: (BuildContext context, AsyncSnapshot<SpCache?> snap) {
          var widget = snap.connectionState == ConnectionState.done
              ? Router(
                  routerDelegate: _routeDelegate,
                )
              : Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

          return MultiProvider(
            providers: topProviders,
            child: Consumer<ThemeProvider>(builder: (BuildContext context,
                ThemeProvider themeProvider, Widget? child) {
              return MaterialApp(
                localizationsDelegates: const [
                  // ... app-specific localization delegate[s] here
                  S.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: widget,
                // 性能信息
                onGenerateRoute:onGenerateRoute,
                theme: themeProvider.getTheme(),
                darkTheme: themeProvider.getTheme(isDarkMode: true),
                themeMode: themeProvider.getThemeMode(),
              );
            }),
          );
        });
  }


}


//请求Uid
void _loadUidData() async {
  try {
    IndexModelEntity result = await MainDao.getUid();
    if(result != null && result.user != null){
      IndexModelUser? user = result.user;
      SpCache.getInstance()?.setString("userId", user!.id.toString());
      print("loadUid success -->>"+user!.name!);
    }
  } on FNetError catch (e) {
    print(e);
  }
}

class FRouteDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  FRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    //跳转listener
    FRouter.getInstance()!.registerRouteJumpListener(
        RouteIntentListener(onJumpTo: (RouteStatus status, {Map? args}) {
      _routeStatus = status;
      switch (status) {
        case RouteStatus.detail:
          this.videoModel = args!['videoModel'];
          break;
        case RouteStatus.bookDetail:
          this.boardInfoDataBangdanList = args!['boardInfo'];
          this.bookId = args['bookId'];
          print("registerRouteJumpListener is --bookId  ->>>>>>>>>>>> ${this.bookId}");
          print("registerRouteJumpListener is  bookId  ->>>>>>>>>>>> ${this.boardInfoDataBangdanList!.newBookName}");
          break;
        case RouteStatus.bookReader:
          this.bookId = args!['bookId'];
          print("start Read Book is --bookId  ->>>>>>>>>>>> ${this.bookId}");
          break;
        case RouteStatus.webview:
          this.articleUrl = args!['article_path'];
          this.articleTitle = args['article_title'];
          break;
        case RouteStatus.article:
          this.cid = args!['article_cid'];
          this.articleTitle = args['article_title'];
          break;
      }

      notifyListeners();
    }));
  }

  List<MaterialPage> pages = [];
  VideoModel? videoModel;
  BoardInfoDataBangdanList? boardInfoDataBangdanList;
  String? articleUrl;
  String? articleTitle;
  String? bookId;
  int cid = 0;

  RoutePath? path;
  RouteStatus _routeStatus = RouteStatus.home;
  DateTime? _lastPressedAt; //上次点击时间

  RouteStatus get routeStatus {
    if ((_routeStatus == RouteStatus.collect) &&
        !SpCache.getInstance()!.isLogin()) {
      showToast("请先登录");
      return _routeStatus = RouteStatus.login;
    } else if (videoModel != null) {
      return _routeStatus = RouteStatus.detail;
    } else {
      return _routeStatus;
    }
  }

  @override
  Widget build(BuildContext context) {
    var index = getPageIndex(pages, routeStatus);
    List<MaterialPage> tempPages = pages;
    if (index != -1) {
      tempPages = tempPages.sublist(0, index);
    }

    //根据状态，创建各个page
    var page;
    switch (routeStatus) {
      case RouteStatus.home:
        pages.clear();
        page = pageWrap(BottomNavigator());
        break;
      case RouteStatus.login:
        page = pageWrap(LoginPage());
        break;
      case RouteStatus.register:
        page = pageWrap(RegisterPage());
        break;
      case RouteStatus.detail:
        page = pageWrap(VideoDetailPage(videoModel!));
        break;
      case RouteStatus.webview:
        page = pageWrap(WebViewPage(url: articleUrl, title: articleTitle));
        break;
      case RouteStatus.bookDetail:
        print("build bookDetail Page  ->>>>>>>>>>>> ${this.bookId}");
        page = pageWrap(BookDetailPage(book: boardInfoDataBangdanList!));
        break;
      case RouteStatus.bookReader:
        print("build bookDetail Page  ->>>>>>>>>>>> ${this.bookId}");
        page = pageWrap(ReaderScene(bookId: boardInfoDataBangdanList!.bookid!));
        break;
      case RouteStatus.article:
        page = pageWrap(ArticlePage(
          cid: cid,
          title: articleTitle,
        ));
        break;
      case RouteStatus.collect:
        page = pageWrap(MyCollectPage());
        break;
      case RouteStatus.about:
        page = pageWrap(AboutPage());
        break;
      case RouteStatus.setting:
        page = pageWrap(SettingPage());
        break;
      case RouteStatus.coinRank:
        page = pageWrap(CoinRankPage());
        break;
      case RouteStatus.unknown:

        break;
    }

    tempPages = [...tempPages, page];
    pages = tempPages;

    //进入页面 通知路由变化
    FRouter.getInstance()?.notify(tempPages, pages);

    return WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 2)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Navigator(
          key: navigatorKey,
          pages: pages,
          onPopPage: (route, result) {
            if (route.settings is MaterialPage) {
              if ((route.settings as MaterialPage).child is LoginPage) {
                // if (LoginDao.getToken() == null) {
                //   showToast('请先登录');
                //   return false;
                // }
              }
            }

            if (!route.didPop(result)) {
              return false;
            }

            //退出时，通知页面变化
            var tempPages = [...pages];
            pages.removeLast();
            FRouter.getInstance()?.notify(pages, tempPages);
            return true;
          },
        ),
         );
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {}
}

pageWrap(Widget child) {
  return MaterialPage(key: ValueKey(child.hashCode), child: child);
}

///页面路径
class RoutePath {
  final String? location;

  RoutePath.home() : location = "/";

  RoutePath.detail() : location = "/detail";
}
