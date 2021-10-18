/*
 * @Author: MarioGo
 * @Date: 2021-10-10 20:11:00
 * @LastEditTime: 2021-10-10 22:00:10
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
            Text("data"),
            Divider(),
            ElevatedButton(
              onPressed: () {
                _counter.count++;
                // showTopDialog(context);
              },
              child: Text('add'),
            ),
            Divider(),
            Text(
              "getBuilder",
              style: TextStyle(fontSize: 30),
            ),
            GetBuilder<CounterController>(
                init: CounterController(),
                builder: (CounterController controller) {
                  return Column(
                    children: [
                      Text("固定数据"),
                      Text("当前显示年龄${controller.balance}"),
                      Text("当前显示年龄${controller.items}"),
                      Text("当前显示年龄${controller.myMap}"),
                      ElevatedButton(
                        onPressed: () {
                          Get.find<CounterController>().addBalance();
                        },
                        child: Text("改变balance数据"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("改变items数据"),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: Text("改变myMap数据"),
                      // ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }

  void showTopDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text('这些一个提示Material Banner'),
        leading: const Icon(Icons.info),
        backgroundColor: Colors.yellow,
        actions: [
          TextButton(
            child: const Text('取消'),
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          ),
        ],
      ),
    );
  }
}
