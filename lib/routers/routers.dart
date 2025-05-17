import 'package:flutter/material.dart';
import '../pages/zhero.dart';
import '../pages/tabs.dart';
import '../common/signIn.dart';

final Map<String, Function> routes = {
  '/': (context) => const Tabs(),
  '/hero': (context, {arguments}) => ZHeroPage(arguments: arguments),
  '/signIn': (context) => const SignIn(),
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name; // 获取路由名称
  final Function? pageContentBuilder = routes[name]; // 获取路由对应的函数
  if (pageContentBuilder != null) { // 如果路由名称存在
    if (settings.arguments != null) { // 如果路由有参数
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
      );
      return route;
    }
  }
  return null; //
};
