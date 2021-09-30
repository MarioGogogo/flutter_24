/*
 * @Author: MarioGo
 * @Date: 2021-09-30 20:19:04
 * @LastEditTime: 2021-09-30 22:35:19
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/common/routes/app_pages.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter_24/pages/demo/index.dart';
import 'package:flutter_24/pages/home/index.dart';
import 'package:flutter_24/pages/lang/index.dart';
import 'package:flutter_24/pages/list/index.dart';
import 'package:flutter_24/pages/list_detail/index.dart';
import 'package:flutter_24/pages/notfound/index.dart';
import 'package:flutter_24/pages/theme/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeView(),
      children: [
        GetPage(
          name: AppRoutes.List,
          page: () => ListView(),
          children: [
            GetPage(
              name: AppRoutes.Detail,
              page: () => DetailView(),
            ),
          ],
        ),
        GetPage(
          name: AppRoutes.Detail_ID,
          page: () => DetailView(),
        ),
      ],
    ),
    // 多语言
    GetPage(name: AppRoutes.Lang, page: () => LangView()),

    // 主题
    GetPage(name: AppRoutes.Theme, page: () => ThemeView()),
    // 其他demo
    GetPage(name: AppRoutes.Demo, page: () => DemoPage()),
  ];
  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundView(),
  );
}
