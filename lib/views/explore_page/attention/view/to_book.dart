import 'package:flutter/material.dart';
import 'package:yuyan_app/models/component/appUI.dart';
import 'package:yuyan_app/models/component/open_page.dart';
import 'package:yuyan_app/models/tools/time_cut.dart';
import 'package:yuyan_app/models/widgets_small/user_event.dart';
import 'package:yuyan_app/state_manage/dataManage/data/attent_data.dart';

Widget toBook(BuildContext context, Data data) {
  return Container(
    padding: EdgeInsets.only(top: 14, bottom: 20),
    decoration: BoxDecoration(
      color: AppColors.background,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(128, 116, 116, 116),
          offset: Offset(0, 0),
          blurRadius: 1,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 44,
                margin: EdgeInsets.only(right: 3),
                child: userEvent(context,
                    login: data.login,
                    userImg: data.avatarUrl,
                    name: data.who,
                    userId: data.userId,
                    event: "${data.did}",
                    time: timeCut(data.when)),
              ),
              Container(
                margin: EdgeInsets.only(top: 13),
                decoration: BoxDecoration(
                  color: AppColors.eventBack,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      data.event.map((f) => oneEvent(context, f)).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget oneEvent(BuildContext context, Event event) {
  return GestureDetector(
    onTap: () {
      String slug = event.url.split("/").last;
      String login = event.url.split("/")[3];
      OpenPage.docBook(
        context,
        bookId: event.id,
        bookSlug: slug,
        login: login,
      );
    },
    child: Container(
      height: 66,
      child: Row(
        children: [
          SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(128, 116, 116, 116),
                    offset: Offset(0, 0),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: ClipOval(
                child: event.avatarUrl != ""
                    ? FadeInImage.assetNetwork(
                        image: event.avatarUrl,
                        placeholder: 'assets/images/explore/book.png',
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/explore/book.png'),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (event.description != null) && (event.description != "")
                  ? [
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text(
                          "${event.title}",
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyleBB,
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        width: 180,
                        margin: EdgeInsets.only(left: 14),
                        child: Text(
                          "${event.description}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textStyleCC,
                        ),
                      )
                    ]
                  : [
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text(
                          "${event.title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textStyleBB,
                        ),
                      ),
                    ],
            ),
          ),
          Container(
            width: 50,
            height: 17,
            margin: EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 16,
                    margin: EdgeInsets.only(right: 3),
                    child: Image.asset(
                      "assets/images/explore/fellower.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      "${event.count}",
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyleCC,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
