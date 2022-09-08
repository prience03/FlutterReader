import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/competive/board_info_entity.dart';
import 'package:flutter_project/widget/board_info_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BoardItemView extends StatelessWidget {
  final BoardInfoDataBangdan? projectInfo;

  const BoardItemView({Key? key, this.projectInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nameTitle = projectInfo!.name!;
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 6, 10, 20),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            //左边添加8像素补白
            padding: EdgeInsets.only(left: 10,top: 10),
            child: Text(
              nameTitle,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10),
            child:
            AlignedGridView.count(
              itemBuilder: (context, index) {
                return _getRotationsListByIndex(index);
              },
              crossAxisCount: 3,
              // children: _getRotationsList(projectInfo!.list!),
              physics: new NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              mainAxisSpacing: 15,
              //垂直间距
              crossAxisSpacing: 10,
              itemCount: projectInfo!.list!.length,
              //水平间距
              // childAspectRatio: 1, //宽高比例
            ),
          )

          // GridView.builder(
          //     shrinkWrap: true,
          //     physics: new NeverScrollableScrollPhysics(),
          //     padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          //     itemCount: projectInfo!.list!.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return BoardCardView(
          //         projectInfo: projectInfo!.list![index],
          //       );
          //     }
          //   // staggeredTileBuilder: (int index) {
          //   //   return StaggeredTile.fit(1);
          //   // }),
          // ),
        ],
      ),
    );
  }

  List<Widget> _getRotationsList(List<BoardInfoDataBangdanList> temp) {
    List<Widget> list = [];
    for (int i = 0; i < temp.length; i++) {
      list.add(Container(
        child: BoardCardView(projectInfo: projectInfo!.list![i]),
      ));
    }
    return list;
  }

  Widget _getRotationsListByIndex(int index) {
    if(index >= projectInfo!.list!.length){
      return new BoardCardView(projectInfo: projectInfo!.list![projectInfo!.list!.length-1]);
    }
    return new BoardCardView(projectInfo: projectInfo!.list![index]);
  }
}
