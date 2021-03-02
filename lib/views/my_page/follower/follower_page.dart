import 'package:flutter/material.dart';
import 'package:yuyan_app/models/component/appUI.dart';
import 'package:yuyan_app/models/component/open_page.dart';
import 'package:yuyan_app/models/net/requests_api/user/data/user_follow_data.dart';
import 'package:yuyan_app/models/net/requests_api/user/user.dart';
import 'package:yuyan_app/models/tools/analytics.dart';
import 'package:yuyan_app/models/tools/clear_text.dart';
import 'package:yuyan_app/models/tools/get_pref.dart';
import 'package:yuyan_app/models/tools/get_tag.dart';
import 'package:yuyan_app/models/widgets_small/list_animation.dart';
import 'package:yuyan_app/models/widgets_small/loading.dart';
import 'package:yuyan_app/models/widgets_small/nothing.dart';
import 'package:yuyan_app/models/widgets_small/user_avatar.dart';
import 'one_buttom.dart';

class FollowerPage extends StatefulWidget {
  FollowerPage({Key key}) : super(key: key);

  @override
  _FollowerPageState createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  int offset = 0;
  List<FollowsData> dataList;
  List<int> userIdFollowed = [];
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    getFollowerData();
  }

  getFollowerData() async {
    var myId = await getPrefIntData("my_id");
    Follows theData =
        await DioUser.getFollowerData(offset: offset, userId: myId);

    if (mounted) {
      setState(() {
        dataList = theData.data;
        offset += 20;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    analytics.logEvent(name: 'follower');
    return Scaffold(
      appBar: AppBar(
        title: Text("关注我的"),
      ),
      body: dataList == null
          ? loading()
          : dataList.isEmpty
              ? NothingPage(
                  top: 50,
                  text: "暂无关注者",
                )
              : animationList(
                  context: context,
                  controller: _controller,
                  dataList: dataList,
                  childBuilder: oneFollow,
                ),

      // ListView.builder(
      //   controller: _controller,
      //   itemCount: dataList.length,
      //   itemBuilder: (context, index) {
      //     return oneFollow(context, dataList[index]);
      //   },
      // ),
    );
  }
}

Widget oneFollow(BuildContext context, FollowsData data) {
  String tag = getTag();
  return GestureDetector(
    onTap: () {
      OpenPage.user(
        context,
        tag: tag,
        login: data.login,
        name: data.name,
        avatarUrl: data.avatarUrl,
        userId: data.id,
      );
    },
    child: Container(
      height: 70,
      margin: EdgeInsets.only(left: 5, top: 2, bottom: 8, right: 5),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 20),
          userAvatar(data.avatarUrl, height: 50),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            margin: EdgeInsets.only(left: 20),
            child: data.description != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          clearText(data.name, 10),
                          style: AppStyles.textStyleB,
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        child: Text(
                          "${clearText(String.fromCharCodes(data.description.toString().runes), 15)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textStyleC,
                        ),
                      ),
                    ],
                  )
                : Container(
                    child: Text(
                      "${data.name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textStyleB,
                    ),
                  ),
          ),
          Spacer(),
          FollowButton(data: data)
        ],
      ),
    ),
  );
}
