import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/competive/board_info_entity.dart';
import 'package:flutter_project/navigator/f_navigatior.dart';
import 'package:flutter_project/utils/cache_util.dart';
import 'package:flutter_project/utils/color.dart';
import 'package:flutter_project/utils/util.dart';

class BoardCardView extends StatelessWidget {
  final BoardInfoDataBangdanList? projectInfo;

  const BoardCardView({Key? key, this.projectInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FRouter.getInstance()?.onIntentTo(RouteStatus.bookDetail, args: {
          "boardInfo": projectInfo!,
          "bookId": projectInfo!.bookid,
        });
        // Navigator.of(context).pushNamed(RouteName.bookDetail,arguments:projectInfo!.list![0]);
      },
      child: SizedBox(
        child:Column(
          children: [
            Card(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_image2(context),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(projectInfo!.newBookName!, style: TextStyle(color: Colors.black, fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Icon(
                            Icons.person,
                            color: primary,
                          ),
                        )
                      ],
                    )],
                ),
              ),
            ),

          ],
        )
      ),
    );
  }

  _image(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        cachedImage(projectInfo!.cover!,
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

  _image2(BuildContext context) {
    return Image(
      image: ExtendedNetworkImageProvider(projectInfo!.cover!,
          cache: true,
          retries: 3,
          timeLimit: const Duration(milliseconds: 100),
          timeRetry: const Duration(milliseconds: 100)),
      width: 94,
      height: 132,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Image.asset(Util.assetImage('image_placeholder.png'));
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(Util.assetImage('image_error.png'));
      },
    );
  }

  _itemTitle() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6, right: 6),
            child: Text(
              projectInfo!.newBookName!,
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
                  projectInfo!.wordCount! + "万字",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
