/*
 * @Author: MarioGo
 * @Date: 2021-09-30 22:34:19
 * @LastEditTime: 2021-10-04 19:25:11
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/demo/index.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo开始表演"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("高仿微信QQ侧滑菜单组件"),
            subtitle: Text('Get.toNamed("/demo/qqsideslip")'),
            onTap: () => Get.toNamed("/demo/qqsideslip"),
          ),
          ListTile(
            title: Text("官方拖拽"),
            subtitle: Text('Get.toNamed("/demo/draggable")'),
            onTap: () => Get.toNamed("/demo/draggable"),
          ),
          ListTile(
            title: Text("dragablegridview"),
            subtitle: Text('Get.toNamed("/demo/darggrid")'),
            onTap: () => Get.toNamed("/demo/darggrid"),
          ),
          ListTile(
            title: Text("上下拖拽组件"),
            subtitle: Text('Get.toNamed("/demo/reorderable")'),
            onTap: () => Get.toNamed("/demo/reorderable"),
          ),
        ],
      ),
    );
  }
}
