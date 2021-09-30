/*
 * @Author: MarioGo
 * @Date: 2021-09-30 22:34:19
 * @LastEditTime: 2021-09-30 22:38:06
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
            title: Text("其他demo"),
            subtitle: Text('Get.toNamed("/home/list")'),
            onTap: () => Get.toNamed("/home/list"),
          ),
        ],
      ),
    );
  }
}
