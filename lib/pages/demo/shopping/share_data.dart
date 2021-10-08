/*
 * @Author: MarioGo
 * @Date: 2021-10-08 17:25:34
 * @LastEditTime: 2021-10-08 17:32:14
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/shopping/share_data.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  final int data; //需要在子树中共享的数据，保存点击次数

  //构造函数
  ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return old.data != data;
  }
}
