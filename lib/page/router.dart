import 'package:flutter/material.dart';

import 'create.dart';
import 'home.dart';
import 'import.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 18:54:07
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-17 09:10:53
 * @FilePath: /tech_research/forcewallet/lib/page/router.dart
 * @Description: 
 */

final routes = {
  "/create": (context) => const CreateWalletPage(),
  "/import": (context) => const ImportWalletPage(),
  "/home": (context, {arguments}) => const HomePage()
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
