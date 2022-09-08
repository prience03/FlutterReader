import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/model/novel/chapter_content_entity.dart';
import 'package:flutter_project/reader/article_provider.dart';
import 'package:flutter_project/utils/toast_util.dart';
import 'package:path_provider/path_provider.dart';

import '../model/novel/chapternew_entity.dart';
import '../utils/screen.dart';
import 'reader_config.dart';
import 'reader_menu.dart';
import 'reader_page_agent.dart';
import 'reader_utils.dart';
import 'reader_view.dart';

enum PageJumpType { stay, firstPage, lastPage }

class ReaderScene extends StatefulWidget {
  final String bookId;

  ReaderScene({required this.bookId});

  String chapterID = "0";

  @override
  ReaderSceneState createState() => ReaderSceneState();
}

class ReaderSceneState extends State<ReaderScene> with RouteAware {
  int pageIndex = 0;
  bool isMenuVisiable = false;
  PageController pageController = PageController(keepPage: false);
  bool isLoading = false;

  double topSafeHeight = 0;

  int currentChapterIndex = 0 ;
  int nextChapterIndex = 0 ;
  int preChapterIndex = 0 ;
  ChapterContentChapterList? preArticle;
  ChapterContentChapterList? currentArticle;
  ChapterContentChapterList? nextArticle;

  List<ChapternewListBookChapters> chapters = [];

  @override
  void initState() {
    super.initState();
    pageController.addListener(onScroll);

    setup();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didPop() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void setup() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // 不延迟的话，安卓获取到的topSafeHeight是错的。
    await Future.delayed(const Duration(milliseconds: 100), () {});
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    topSafeHeight = Screen.topSafeHeight;

    // List<dynamic> chaptersResponse = await Request.get(action: 'catalog');
    // chaptersResponse.forEach((data) {
    //   chapters.add(Chapter.fromJson(data));
    // });

    // final directory = await getApplicationDocumentsDirectory();
    // String path = directory.path;
    await _getBookVolume(widget.bookId);
  }



  Future<void> _getBookVolume(String bookID) async {
    var fetchBookVolume = await ArticleProvider.fetchBookVolume(widget.bookId);
    fetchBookVolume.list?.forEach((element) {
          element.bookChapters?.forEach((element) {
              chapters.add(element);
          });
    });
    await resetContent(widget.chapterID,chapters[0].id!, PageJumpType.stay);
  }


  void nextChapter(){
    int temp = currentChapterIndex;
    currentChapterIndex = nextChapterIndex;
    preChapterIndex = temp;
    nextChapterIndex = currentChapterIndex + 1;
  }

  void preChapter(){
    int temp = currentChapterIndex;
    currentChapterIndex = nextChapterIndex;
    preChapterIndex = currentChapterIndex;
    nextChapterIndex = temp;
  }


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$counter');
  }

  resetContent(String articleId,int chapterID, PageJumpType jumpType) async {
    currentArticle = await fetchArticle(articleId);
    if (preArticle != null && preArticle!.id!.isNotEmpty) {
      preArticle = await getCurrenChapterContent(preArticle!.id!);
    } else {
      preArticle = null;
    }
    if (nextArticle != null && nextArticle!.id!.isNotEmpty) {
      nextArticle = await getCurrenChapterContent(nextArticle!.id!);
    } else {
      nextArticle = null;
    }
    if (jumpType == PageJumpType.firstPage) {
      pageIndex = 0;
    } else if (jumpType == PageJumpType.lastPage) {
      pageIndex = currentArticle!.pageCount - 1;
    }
    if (jumpType != PageJumpType.stay) {
      pageController.jumpToPage(
          (preArticle != null ? preArticle!.pageCount : 0) + pageIndex);
    }

    setState(() {});
  }

  onScroll() {
    var page = pageController.offset / Screen.width;

    var nextArtilePage = currentArticle!.pageCount + (preArticle != null ? preArticle!.pageCount : 0);
    print("page is -->>($page)  ,  preArticle is ${preArticle?.pageCount}   -----  nextArtilePage is ${nextArtilePage}  ， currentArticle!.pageCount  is -->>${currentArticle!.pageCount}");

    if (page >= nextArtilePage) {
      print('到达下个章节了');

      preArticle = currentArticle;
      currentArticle = nextArticle;
      nextArticle = null;
      print("getContent Result is currentArticle -->> ${currentArticle?.name}");
      print("getContent Result is preArticle -->> ${preArticle?.name}");
      print("getContent Result is nextArticle -->> ${nextArticle?.name}");
      pageIndex = 0;
      pageController.jumpToPage(preArticle!.pageCount);
      fetchNextArticle(currentArticle!.id!);
      setState(() {});
    }
    if (preArticle != null && page <= preArticle!.pageCount - 1) {
      print('到达上个章节了');

      nextArticle = currentArticle;
      currentArticle = preArticle;
      preArticle = null;
      pageIndex = currentArticle!.pageCount - 1;
      pageController.jumpToPage(currentArticle!.pageCount - 1);
      fetchPreviousArticle(currentArticle!.id!);
      setState(() {});
    }
  }

  fetchPreviousArticle(String articleId) async {
    if (preArticle != null || isLoading || articleId == 0) {
      return;
    }
    isLoading = true;
    preArticle = await getCurrenChapterContent(articleId,type:"pre");
    pageController.jumpToPage(preArticle!.pageCount + pageIndex);
    isLoading = false;
    setState(() {});
  }

  fetchNextArticle(String articleId) async {
    if (nextArticle != null || isLoading || articleId == 0) {
      return;
    }
    isLoading = true;
    nextArticle = await getCurrenChapterContent(articleId,type:"next");
    nextArticle = await getCurrenChapterContent(nextArticle!.id!);

    print("fetchNextArticle Result is nextArticle -->> ${nextArticle?.name}");
    print("fetchNextArticle Result is nextArticle -->> ${nextArticle?.pageCount}");

    isLoading = false;
    setState(() {});
  }

  Future<ChapterContentChapterList> fetchArticle(String articleId) async {
    var article = await ArticleProvider.fetchArticle(widget.bookId, articleId);
    var contentHeight = Screen.height -
        topSafeHeight -
        ReaderUtils.topOffset -
        Screen.bottomSafeHeight -
        ReaderUtils.bottomOffset -
        20;
    var contentWidth = Screen.width - 15 - 10;
    ChapterContentChapterList? chapterContent ;
    article.chapterList?.forEach((element) {
        if(element.flag == "curr"){
          chapterContent = element;
          currentArticle = element;
          chapterContent?.pageOffsets = ReaderPageAgent.getPageOffsets(chapterContent!.content!,
              contentHeight, contentWidth, ReaderConfig.instance.fontSize);
        }
        else if(element.flag == "next"){
          nextArticle = element;
          nextArticle?.pageOffsets = ReaderPageAgent.getPageOffsets(nextArticle!.content!,
              contentHeight, contentWidth, ReaderConfig.instance.fontSize);
        }else if(element.flag == "pre"){
          preArticle = element;
          preArticle?.pageOffsets = ReaderPageAgent.getPageOffsets(preArticle!.content!,
              contentHeight, contentWidth, ReaderConfig.instance.fontSize);
        }
    });
    return chapterContent!;
  }


  Future<ChapterContentChapterList> getCurrenChapterContent(String articleId,{String type = "curr"}) async {
    var article = await ArticleProvider.fetchArticle(widget.bookId, articleId);
    var contentHeight = Screen.height -
        topSafeHeight -
        ReaderUtils.topOffset -
        Screen.bottomSafeHeight -
        ReaderUtils.bottomOffset -
        20;
    var contentWidth = Screen.width - 15 - 10;
    ChapterContentChapterList? chapterContent ;
    article.chapterList?.forEach((element) {
      if(element.flag == type){
        chapterContent = element;
        chapterContent?.pageOffsets = ReaderPageAgent.getPageOffsets(chapterContent!.content!,
            contentHeight, contentWidth, ReaderConfig.instance.fontSize);
      }
    });
    return chapterContent!;
  }

  onTap(Offset position) async {
    double xRate = position.dx / Screen.width;
    if (xRate > 0.33 && xRate < 0.66) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      setState(() {
        isMenuVisiable = true;
      });
    } else if (xRate >= 0.66) {
      nextPage();
    } else {
      previousPage();
    }
  }

  onPageChanged(int index) {
    var page = index - (preArticle != null ? preArticle!.pageCount : 0);
    if (page < currentArticle!.pageCount && page >= 0) {
      setState(() {
        pageIndex = page;
      });
    }
  }

  previousPage() {
    if (pageIndex == 0 && preArticle!.id!.isEmpty) {
      showToast('已经是第一页了');
      return;
    }
    pageController.previousPage(
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  nextPage() {
    if (pageIndex >= currentArticle!.pageCount - 1 &&
        nextArticle!.id!.isEmpty) {
      showToast('已经是最后一页了');
      return;
    }
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  Widget buildPage(BuildContext context, int index) {
    var page = index - (preArticle != null ? preArticle!.pageCount : 0);
    var article;
    if (page >= this.currentArticle!.pageCount) {
      // 到达下一章了
      article = nextArticle;
      page = 0;
    } else if (page < 0) {
      // 到达上一章了
      article = preArticle;
      page = preArticle!.pageCount - 1;
    } else {
      article = this.currentArticle;
    }

    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        onTap(details.globalPosition);
      },
      child: ReaderView(
          article: article, page: page, topSafeHeight: topSafeHeight),
    );
  }

  buildPageView() {
    if (currentArticle == null) {
      return Container();
    }

    int preCount = preArticle != null ? preArticle!.pageCount : 0;
    int currentCount = currentArticle!.pageCount;
    int nextCount = (nextArticle != null ? nextArticle!.pageCount : 0);
    print("preCount is $preCount");
    print("currentCount is $currentCount");
    print("nextCount is $nextCount");
    int itemCount = (preCount) + currentCount + nextCount ;
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: pageController,
      itemCount: itemCount,
      itemBuilder: buildPage,
      onPageChanged: onPageChanged,
    );
  }

  buildMenu() {
    if (!isMenuVisiable) {
      return Container();
    }
    return ReaderMenu(
      chapters: chapters,
      articleIndex: _getIndexByChapter(),
      onTap: hideMenu,
      onPreviousArticle: () {
        // resetContent(currentArticle!.preArticleId, PageJumpType.firstPage);
      },
      onNextArticle: () {
        // resetContent(currentArticle!.nextArticleId, PageJumpType.firstPage);
      },
      onToggleChapter: (ChapternewListBookChapters chapter) {
        // resetContent(chapter.id.toString(), PageJumpType.firstPage);
      },
    );
  }

  int _getIndexByChapter(){
    int index = 0;
    if(currentArticle != null){
      for (var value in chapters) {
        if(value.id == currentArticle!.id){
          index++;
          break;
        }
      }
    }
    return index;
  }


  hideMenu() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    setState(() {
      this.isMenuVisiable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentArticle == null) {
      return Scaffold();
    }

    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: <Widget>[
            Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Image.asset('img/read_bg.png', fit: BoxFit.cover)),
            buildPageView(),
            buildMenu(),
          ],
        ),
      ),
    );
  }
}
