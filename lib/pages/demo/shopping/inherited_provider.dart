/*
 * @Author: MarioGo
 * @Date: 2021-10-09 17:25:51
 * @LastEditTime: 2021-10-09 17:25:51
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/shopping/inherited_provider.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

// 一个通用的InheritedWidget，保存需要跨组件共享的状态
import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({
    required this.data,
    required Widget child,
  }) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}
