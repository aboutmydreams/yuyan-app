import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yuyan_app/models/component/appUI.dart';
import 'package:yuyan_app/models/net/requests_api/group/data/group_home_data.dart';
import 'package:yuyan_app/util/time_cut.dart';
import 'package:yuyan_app/models/widgets_small/loading.dart';
import 'package:yuyan_app/models/widgets_small/nothing.dart';

class GroupHome extends StatelessWidget {
  GroupHome({Key key, this.homeJson}) : super(key: key);
  final GroupHomeJson homeJson;

  @override
  Widget build(BuildContext context) {
    return homeJson == null
        ? loading()
        : homeJson.data.isEmpty
            ? NothingPage(top: 190, text: "首页空空")
            : SingleChildScrollView(
                child: Column(
                  children: [SizedBox(height: 155)]
                    ..addAll(homeJson.data.map((a) {
                      return oneHome(context, a);
                    }).toList()),
                ),
              );
  }
}

Widget oneHome(BuildContext context, Data data) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "${data.name}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyleB,
            ),
          ),
        ),
      ]..addAll(data.books.map((b) {
          return oneHomeBook(context, b);
        })),
    ),
  );
}

Widget oneHomeBook(BuildContext context, Books data) {
  return GestureDetector(
    onTap: () {
      // openUrl(context, "https://www.yuque.com/${data.login}");
    },
    child: Container(
      margin: EdgeInsets.only(left: 15, top: 2, bottom: 8, right: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            offset: Offset(1, 2),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 14,
                height: 14,
                child: AppIcon.iconType(data.type, size: 17),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                margin: EdgeInsets.only(left: 20),
                child: Container(
                  child: Text(
                    "${data.name}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyleB,
                  ),
                ),
              ),
            ],
          ),
        ]..addAll(data.type != "Design"
            ? data.summary.map((s) {
                return oneHomeDoc(context, s, data.user.login, data.slug);
              })
            : [
                Row(
                  children: <Widget>[]..addAll(data.summary.map((d) {
                      return oneDesign(context, d);
                    })),
                )
              ]),
      ),
    ),
  );
}

Widget oneHomeDoc(
    BuildContext context, Summary data, String login, String bookSlug) {
  return InkWell(
    onTap: () {
      // OpenPage.docWeb(
      //   context,
      //   login: login,
      //   bookSlug: bookSlug,
      //   bookId: data.bookId,
      //   docId: data.id,
      // );
    },
    child: Container(
      padding: EdgeInsets.fromLTRB(0, 7, 0, 2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(data.title ?? data.titleDraft),
          ),
          Text(
            timeCut(data.contentUpdatedAt ?? data.createdAt),
            style: AppStyles.textStyleCC,
          ),
        ],
      ),
    ),
  );
}

Widget oneDesign(BuildContext context, Summary data) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 7, 0, 2),
    width: (MediaQuery.of(context).size.width - 70) / 3,
    child: CachedNetworkImage(imageUrl: data.image),
  );
}
