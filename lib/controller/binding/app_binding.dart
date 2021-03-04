import 'package:get/get.dart';
import 'package:yuyan_app/controller/attend_controller.dart';
import 'package:yuyan_app/controller/bottom_nav_controller.dart';
import 'package:yuyan_app/controller/theme_controller.dart';
import 'package:yuyan_app/controller/version_controller.dart';
import 'package:yuyan_app/state_manage/dataManage/select_manage.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(BottomNavigatorController());
    Get.put(AttendController());
    Get.put(ExploreRecommendController());
    Get.put(ExploreSelectionController());

    Get.lazyPut(() => VersionController());
  }
}
