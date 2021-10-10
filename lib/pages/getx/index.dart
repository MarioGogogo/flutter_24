/*
 * @Author: MarioGo
 * @Date: 2021-10-10 20:11:00
 * @LastEditTime: 2021-10-10 20:53:16
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/getx/index.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:flutter_24/pages/getx/aComp.dart';
import 'package:flutter_24/pages/getx/bComp.dart';
import 'package:get/get.dart';

import 'controller.dart';

class StateObxView extends StatelessWidget {
// 初始化计数器控制器，放入依赖管理中，并获取这个实例
  final _counter = Get.put(CounterController());

  StateObxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Obx(...)"),
      ),
      body: Center(
        child: Column(
          children: [
            AComp(),
            BComp(),
            Divider(),
            ElevatedButton(
              onPressed: () {
                _counter.count++;
              },
              child: Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
