/*
 * @Author: MarioGo
 * @Date: 2021-10-09 21:42:18
 * @LastEditTime: 2021-10-09 22:22:23
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/eventBus/eventBus.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

//EventBus.dart
import 'package:event_bus/event_bus.dart';

//初始化Bus
EventBus eventBus = EventBus();

//商品详情中全局监听的事件（点击购物车）
class ProductDetailEvent {
  String msg;
  int count;
  ProductDetailEvent(this.msg, this.count);
}
