import 'package:flutter/material.dart';
import 'package:yuyan_app/models/component/appUI.dart';
import 'package:yuyan_app/models/net/requests_api/user/data/user_follow_data.dart';
import 'package:yuyan_app/models/net/requests_api/user/user.dart';
import 'package:yuyan_app/models/widgets_small/loading.dart';
import 'package:yuyan_app/models/widgets_small/toast.dart';
import 'package:yuyan_app/state_manage/toppest.dart';

class FollowButtom extends StatefulWidget {
  FollowButtom({Key key, this.data}) : super(key: key);

  final FollowsData data;

  @override
  _FollowButtomState createState() => _FollowButtomState(data: data);
}

class _FollowButtomState extends State<FollowButtom> {
  _FollowButtomState({Key key, this.data});
  final FollowsData data;

  bool followed;
  bool ifLoading = false;

  @override
  void initState() {
    super.initState();
    followed = data.isfollow;
  }

  changeLoading() {
    setState(() {
      ifLoading = !ifLoading;
    });
  }

  changeFollow() {
    setState(() {
      followed = !followed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 35,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: topModel.primarySwatchColor.withOpacity(0.8),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: FlatButton(
        onPressed: () async {
          changeLoading();
          if (followed) {
            var ans = await DioUser.cancelFollow(userId: data.id);
            if (ans == 1) {
              myToast(context, "取消关注成功");
              changeLoading();
              changeFollow();
            } else {
              myToast(context, "网络错误");
              changeLoading();
            }
          } else {
            var ans = await DioUser.followUser(userId: data.id);
            if (ans == 1) {
              myToast(context, "关注成功");
              changeLoading();
              changeFollow();
            } else {
              myToast(context, "网络错误");
              changeLoading();
            }
          }
        },
        child: ifLoading
            ? Container(
                width: 20,
                height: 20,
                child: loading(),
              )
            : Center(
                child: Text(
                "${followed ? '取消关注' : '关注'}",
                style: TextStyle(color: Theme.of(context).canvasColor),
              )),
      ),
    );
  }
}
