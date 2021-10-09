/*
 * @Author: MarioGo
 * @Date: 2021-10-09 17:22:57
 * @LastEditTime: 2021-10-09 17:23:59
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/shopping/change_notifier.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

//!实现了一个Flutter风格的发布者-订阅者模式
class ChangeNotifier implements Listenable {
  List listeners = [];
  @override
  void addListener(VoidCallback listener) {
    //添加监听器
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    //移除监听器
    listeners.remove(listener);
  }

  //通知所有监听着
  void notifyListeners() {
    //通知所有监听器，触发监听器回调
    listeners.forEach((item) => item());
  }
}
