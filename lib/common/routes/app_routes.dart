/*
 * @Author: MarioGo
 * @Date: 2021-09-30 20:18:36
 * @LastEditTime: 2021-10-10 20:35:32
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/common/routes/app_routes.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
part of 'app_pages.dart';

abstract class AppRoutes {
  static const Home = '/home';
  static const List = '/list';
  static const Detail = '/detail';
  static const Detail_ID = '/detail/:id';
  static const NotFound = '/notfound';
  static const Lang = '/lang';
  static const Theme = '/theme';
  static const Demo = '/demo';
  static const QQSideslip = '/qqsideslip';
  static const Draggable = '/draggable';
  static const DragAbleGrid = '/darggrid';
  static const Reorderable = '/reorderable';
  static const ReorderableGrid = '/reordergrid'; //上下左右

  static const DragGridView = '/draggridview';
  static const ScaleAnimatePage = '/baseAnimation';
  static const HeaderUIPage = '/headui';
  static const MovieScrollPage = "/movescroll";
  static const EeventHandlePage = "/eventhandle";
  static const FuturePage = "/future";
  static const ShoppingPage = "/shoppingpage";
  static const EventBusPage = "/eventbuspage";
  static const ProviderPage = "/providerpage";
  static const GetxPage = "/getxpage";
}
