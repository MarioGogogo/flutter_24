/*
 * @Author: MarioGo
 * @Date: 2021-09-30 20:19:04
 * @LastEditTime: 2021-10-07 11:52:10
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/common/routes/app_pages.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter_24/pages/animation/demo.dart';
import 'package:flutter_24/pages/demo/dargGrid.dart';
import 'package:flutter_24/pages/demo/draggable.dart';
import 'package:flutter_24/pages/demo/index.dart';
import 'package:flutter_24/pages/demo/qqSideslip.dart';
import 'package:flutter_24/pages/demo/reorderable.dart';
import 'package:flutter_24/pages/demo/reorderableGridView.dart';
import 'package:flutter_24/pages/home/index.dart';
import 'package:flutter_24/pages/lang/index.dart';
import 'package:flutter_24/pages/list/index.dart';
import 'package:flutter_24/pages/list_detail/index.dart';
import 'package:flutter_24/pages/notfound/index.dart';
import 'package:flutter_24/pages/theme/index.dart';
import 'package:flutter_24/pages/ui/index.dart';
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
    GetPage(name: AppRoutes.Demo, page: () => DemoPage(), children: [
      GetPage(
        name: AppRoutes.QQSideslip,
        page: () => QQSideslipPage(),
      ),
      GetPage(
        name: AppRoutes.Draggable,
        page: () => DraggablePage(),
      ),
      GetPage(
        name: AppRoutes.Reorderable,
        page: () => ReorderablePage(),
      ),
      GetPage(
        name: AppRoutes.DragAbleGrid,
        page: () => ReorderablePage(),
      ),
      GetPage(
        name: AppRoutes.ReorderableGrid,
        page: () => ReorderableGridViewPage(),
      ),
      GetPage(
        name: AppRoutes.DragGridView,
        page: () => DraggableGridViewPage(),
      ),
      //动画
      GetPage(
        name: AppRoutes.ScaleAnimatePage,
        page: () => ScaleAnimationPage(),
      ),
      GetPage(
        name: AppRoutes.HeaderUIPage,
        page: () => HeaderUIPage(),
      ),
    ]),

    // 多语言
    GetPage(name: AppRoutes.Lang, page: () => LangView()),

    // 主题
    GetPage(name: AppRoutes.Theme, page: () => ThemeView()),
  ];
  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundView(),
  );
}
