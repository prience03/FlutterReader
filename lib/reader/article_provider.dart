
import 'package:flutter_project/http/core/f_net.dart';
import 'package:flutter_project/http/request/reader/ReaderContentRequest.dart';
import 'package:flutter_project/model/novel/chapternew_entity.dart';

import '../model/novel/chapter_content_entity.dart';


class ArticleProvider {
  static Future<ChapterContentEntity> fetchArticle(String bookID,String chapterId) async {
    ReaderContentRequest readerContentRequest =  ReaderContentRequest("");
    readerContentRequest.add("bookId",bookID);
    readerContentRequest.add("chapterId",chapterId);
    readerContentRequest.add("full","0");

    var result = await FNet.getInstance().fire(readerContentRequest);
    var article = ChapterContentEntity.fromJson(result);
    return article;
  }


  static Future<ChapternewEntity> fetchBookVolume(String bookID) async {
    ReaderContentRequest readerContentRequest =  ReaderContentRequest("cx/itf/getvolume");
    readerContentRequest.add("bookId",bookID);
    var result = await FNet.getInstance().fire(readerContentRequest);
    var chapterVolume = ChapternewEntity.fromJson(result);
    return chapterVolume;
  }
}