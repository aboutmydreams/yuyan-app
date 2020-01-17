import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:yuyan_app/routes/top_route.dart';
import 'package:yuyan_app/state_manage/toppest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await topModel.colorManage.getMyColor();
  runApp(MyApp(
    model: topModel,
  ));
}

class MyApp extends StatelessWidget {
  final TopStateModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<TopStateModel>(
      model: model,
      child: MyMeterialApp(),
    );
  }
}

class MyMeterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TopStateModel>(
      builder: (context, child, model) {
        return MaterialApp(
          title: '语燕',
          initialRoute: '/first',
          debugShowCheckedModeBanner: false, // 去除debug标志
          routes: routeData,

          theme: ThemeData(
            platform: TargetPlatform.iOS, // 右滑返回
            primarySwatch: model.colorManage.primarySwatchColor,
            highlightColor: Color.fromRGBO(255, 255, 255, 0.9),
            splashColor: Colors.yellow,
            accentColor: Color.fromRGBO(25, 25, 25, 1.0),
          ),
          // home: MyHomePage(),
        );
      },
    );
  }
}
