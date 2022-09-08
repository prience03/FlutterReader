import 'package:flutter/material.dart';
import 'package:flutter_project/generated/l10n.dart';
import 'package:flutter_project/global.dart';
import 'package:flutter_project/model/competive/board_info_entity.dart';
import 'package:flutter_project/provider/provider_widget.dart';
import 'package:flutter_project/utils/dimens.dart';
import 'package:flutter_project/utils/styles.dart';
import 'package:flutter_project/widget/space_divider.dart';
import 'package:provider/provider.dart';

import '../navigator/f_navigatior.dart';
import 'book_detail_header.dart';


/// 书籍首页，或者书籍详情页
class BookDetailPage extends StatelessWidget {
  final BoardInfoDataBangdanList book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  Widget _buildBottomSheet(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: InkWell(
            child: Container(
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: accentGradient,
              ),
              child: Text(
                S.of(context).startReading,
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: Colors.white),
              ),
            ),
            onTap: () {
              // if (Global.checkLogin(context: context)) return;
              // 开始阅读
              // showLoadingDialog(context, '请在读取内容，请稍等...');
              // Chapter chapter = lastReadingRecords(book.id!);

              FRouter.getInstance()?.onIntentTo(RouteStatus.bookReader, args: {
                "bookId": book.bookid,
              });
              // Navigator.of(context).pushNamed(
              //   RouteName.about,
              //   arguments: [book.bookid],
              // );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCatalog(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.all(itemPadding),
      decoration: itemDecoration(context: context),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Text(
              S.of(context).catalog + ': ',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Expanded(
              child: Text(
                S.of(context).latest + book.newBookName!,
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 1,
              ),
            ),
            const Icon(Icons.chevron_right, size: 18),
          ],
        ),
        onTap: () {
          // Navigator.of(context).pushNamed(RouteName.catalog, arguments: book);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: pageEdgeInsets,
      child: Column(
        children: <Widget>[
          BookDetailHeaderView(book: book),
          const SpaceDivider.medium(),
          _buildCatalog(context),
          const SpaceDivider.medium(),
          // MaybeLikeView(book: book, pushReplacement: true),
          const SpaceDivider.medium(),
          // SameTypeView(book: book, pushReplacement: true),
          const SpaceDivider(height: 64),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.newBookName!)),
      body: _buildBody(context),
      bottomSheet: _buildBottomSheet(context),
    );
  }
}
