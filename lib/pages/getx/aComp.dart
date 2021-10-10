/*
 * @Author: MarioGo
 * @Date: 2021-10-10 20:44:09
 * @LastEditTime: 2021-10-10 20:54:15
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/getx/aComp.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class AComp extends StatelessWidget {
  // 初始化计数器控制器，放入依赖管理中，并获取这个实例
  final _counter = Get.put(CounterController());
  AComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text("count2 -> " + _counter.count.value.toString()));
  }
}
