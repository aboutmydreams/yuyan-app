import 'package:flutter/material.dart';
import 'package:yuyan_app/models/component/appUI.dart';
import 'package:yuyan_app/models/component/open_page.dart';
import 'package:yuyan_app/models/net/requests_api/group/data/group_topic_data.dart';
import 'package:yuyan_app/util/clear_text.dart';
import 'package:yuyan_app/util/time_cut.dart';
import 'package:yuyan_app/models/widgets_small/user_avatar.dart';

Widget oneTopic(BuildContext context, OneTopicData data) {
  return GestureDetector(
    onTap: () {
      OpenPage.topic(
        context,
        id: data.id,
        groupId: data.groupId,
        iid: data.iid,
      );
    },
    child: Container(
        height: 70,
        margin: EdgeInsets.only(left: 15, top: 10, right: 15),
        padding: EdgeInsets.only(left: 15, top: 12, bottom: 10, right: 15),
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
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    clearText(data.title, 15),
                    style: AppStyles.textStyleB,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    userAvatar(data.user.avatarUrl, height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      margin: EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 2),
                          Container(
                            child: Text(
                              "${data.user.name} 创建于 ${timeCut(data.createdAt)}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.textStyleC,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 4),
              width: 45,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.question_answer,
                      size: 19,
                    ),
                  ),
                  SizedBox(width: 7),
                  Text("${data.commentsCount}")
                ],
              ),
            )
          ],
        )),
  );
}
