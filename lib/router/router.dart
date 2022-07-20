import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/page/home.dart';

import '../page/game_detail.dart';

///  @author: shuYang
///  @date: 2022/7/20
///  @description:
class RouterManager{

  static const home = "/";
  static const gameDetail = "/gameDetail";


}


final routerMap = {
  RouterManager.home : (context) => const HomePage(),
  RouterManager.gameDetail : (context) => const GameDetailPage()
};

Route? onGenerateRoute(RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageBuilder = routerMap[name];
  if (pageBuilder != null) {
    if (settings.arguments != null) {
      // 如果透传了参数
      return CupertinoPageRoute(
          builder: (context) =>
              pageBuilder(context, arguments: settings.arguments));
    } else {
      // 没有透传参数
      return CupertinoPageRoute(builder: (context) => pageBuilder(context));
    }
  }
  return null;
}

