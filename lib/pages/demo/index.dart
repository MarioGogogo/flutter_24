/*
 * @Author: MarioGo
 * @Date: 2021-09-30 22:34:19
 * @LastEditTime: 2021-10-07 11:52:51
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
            title: Text("仿支付宝功能拖拽"),
            subtitle: Text('Get.toNamed("/demo/draggable")'),
            onTap: () => Get.toNamed("/demo/draggable"),
          ),
          ListTile(
            title: Text("上下左右拖拽"),
            subtitle: Text('Get.toNamed("/demo/reordergrid")'),
            onTap: () => Get.toNamed("/demo/reordergrid"),
          ),
          ListTile(
            title: Text("上下拖拽组件"),
            subtitle: Text('Get.toNamed("/demo/reorderable")'),
            onTap: () => Get.toNamed("/demo/reorderable"),
          ),
          ListTile(
            title: Text("DraggableGridViewDemo"),
            subtitle: Text('Get.toNamed("/demo/draggridview")'),
            onTap: () => Get.toNamed("/demo/draggridview"),
          ),
          ListTile(
            title: Text("动画-demo"),
            subtitle: Text('Get.toNamed("/demo/baseAnimation")'),
            onTap: () => Get.toNamed("/demo/baseAnimation"),
          ),
          ListTile(
            title: Text("头部半圆ui"),
            subtitle: Text('Get.toNamed("/demo/headui")'),
            onTap: () => Get.toNamed("/demo/headui"),
          ),
        ],
      ),
    );
  }
}
