import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/competive/board_info_entity.dart';
import 'package:flutter_project/model/project/project_model.dart';
import 'package:flutter_project/navigator/f_navigatior.dart';
import 'package:flutter_project/utils/cache_util.dart';
import 'package:flutter_project/utils/color.dart';

import '../global.dart';

class BoardCardView extends StatelessWidget {
  final BoardInfoDataBangdan? projectInfo;

  const BoardCardView({Key? key, this.projectInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FRouter.getInstance()?.onIntentTo(RouteStatus.bookDetail, args: {
          "boardInfo": projectInfo!.list![0],
          "bookId": projectInfo!.list![0].bookid,
        });
        // Navigator.of(context).pushNamed(RouteName.bookDetail,arguments:projectInfo!.list![0]);
      },
      child: SizedBox(
        height: 280,
        child: Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_image(context), _itemTitle()],
            ),
          ),
        ),
      ),
    );
  }

  _image(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        cachedImage(projectInfo!.list![0].cover!,
            width: size.width / 2 - 10, height: 180),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 5),
              decoration: BoxDecoration(
                  //渐变
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black54, Colors.transparent])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ))
      ],
    );
  }

  _itemTitle() {
    return Expanded(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6, right: 6),
            child: Text(
              projectInfo!.name!,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Icon(
                  Icons.person,
                  color: primary,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  projectInfo!.actionName!,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
