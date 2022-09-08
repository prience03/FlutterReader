import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_project/base/base_refresh_load_state.dart';
import 'package:flutter_project/http/dao/project_dao.dart';
import 'package:flutter_project/model/competive/board_info_entity.dart';
import 'package:flutter_project/widget/board_info_view.dart';
import 'package:flutter_project/widget/board_item_view.dart';

///项目模块下，每个tab下的公用页面
class CompetiveChildTabPage extends StatefulWidget {
  final int? cid;
  final String? tagName;
  final int? tagPlace;
  final int? tagType;

  const CompetiveChildTabPage(
      {Key? key, this.cid, this.tagName, this.tagPlace, required this.tagType})
      : super(key: key);

  @override
  _CompetiveChildTabPageState createState() => _CompetiveChildTabPageState();
}

class _CompetiveChildTabPageState extends BaseRefreshLoadStateState<
    BoardInfoData, BoardInfoDataBangdan, CompetiveChildTabPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  get child => MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
          child: ListView.builder(
              // controller: scrollController,
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return BoardItemView(
                  projectInfo: dataList[index],
                );
              }
              // staggeredTileBuilder: (int index) {
              //   return StaggeredTile.fit(1);
              // }),
              )
      )
  );

  @override
  Future<BoardInfoData> getData(int curPage) async {
    BoardInfoData projectModel = await ProjectDao.getCreadFromTab(
        curPage, widget.cid!, widget.tagType!, widget.tagPlace!);
    return projectModel;
  }

  @override
  List<BoardInfoDataBangdan> parseList(BoardInfoData result) {
    return result.bangdan!;
  }
}
