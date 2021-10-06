/*
 * @Author: MarioGo
 * @Date: 2021-09-30 20:17:38
 * @LastEditTime: 2021-10-05 16:13:48
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_24/lib/pages/home/index.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:flutter_24/common/routes/app_pages.dart';
import 'package:flutter_24/pages/list_detail/index.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  _showSnackbar(Map? result) {
    if (result != null) {
      Get.snackbar("返回值", "success -> " + result["success"].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("其他demo"),
            subtitle: Text('Get.toNamed("/demo")'),
            onTap: () => Get.toNamed("/demo"),
          ),
          // 路由&导航
          ListTile(
            title: Text("导航-命名路由 home > list"),
            subtitle: Text('Get.toNamed("/home/list")'),
            onTap: () => Get.toNamed("/home/list"),
          ),
          Divider(),
          ListTile(
            title: Text("导航-命名路由 home > list > detail"),
            subtitle: Text('Get.toNamed("/home/list/detail")'),
            onTap: () => Get.toNamed("/home/list/detail"),
          ),
          Divider(),
          ListTile(
            title: Text("导航-类对象"),
            subtitle: Text("Get.to(DetailView())"),
            onTap: () => Get.to(DetailView()),
          ),
          Divider(),
          ListTile(
            title: Text("导航-清除上一个"),
            subtitle: Text("Get.off(DetailView())"),
            onTap: () => Get.off(DetailView()),
          ),
          Divider(),
          ListTile(
            title: Text("导航-清除所有"),
            subtitle: Text("Get.offAll(DetailView())"),
            onTap: () => Get.offAll(DetailView()),
          ),
          Divider(),
          ListTile(
            title: Text("导航-arguments传值+返回值"),
            subtitle: Text(
                'Get.toNamed("/home/list/detail", arguments: {"id": 999})'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail",
                  arguments: {"id": 999});
              _showSnackbar(result);
            },
          ),
          Divider(),
          ListTile(
            title: Text("导航-parameters传值+返回值"),
            subtitle: Text('Get.toNamed("/home/list/detail?id=666")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail?id=666");
              _showSnackbar(result);
            },
          ),
          Divider(),
          ListTile(
            title: Text("导航-参数传值+返回值"),
            subtitle: Text('Get.toNamed("/home/list/detail/777")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail/777");
              _showSnackbar(result);
            },
          ),
          Divider(),
          ListTile(
            title: Text("导航-not found"),
            subtitle: Text('Get.toNamed("/aaa/bbb/ccc")'),
            onTap: () => Get.toNamed("/aaa/bbb/ccc"),
          ),
          // 组件
          Divider(),
          ListTile(
            title: Text("组件-snackbar"),
            subtitle: Text('Get.snackbar("标题","消息",...)'),
            onTap: () => Get.snackbar(
              "标题",
              "消息",
            ),
          ),
          Divider(),
          ListTile(
            title: Text("组件-dialog"),
            subtitle: Text('Get.defaultDialog(...)'),
            onTap: () => Get.defaultDialog(
              title: "标题",
              content: Column(
                children: [
                  Text("第1行"),
                  Text("第2行"),
                  Text("第3行"),
                ],
              ),
              textConfirm: "确认",
              textCancel: "取消",
              onConfirm: () => Get.back(),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("组件-bottomSheet"),
            subtitle: Text('Get.bottomSheet(...)'),
            onTap: () => Get.bottomSheet(
              Container(
                height: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    Text("第1行"),
                    Text("第2行"),
                    Text("第3行"),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          // 多语言
          ListTile(
            title: Text("Lang"),
            subtitle: Text('Get.toNamed(AppRoutes.Lang)'),
            onTap: () => Get.toNamed(AppRoutes.Lang),
          ),
          Divider(),

          // 样式
          ListTile(
            title: Text("Theme"),
            subtitle: Text('Get.toNamed(AppRoutes.Theme)'),
            onTap: () => Get.toNamed(AppRoutes.Theme),
          ),
          Divider(),
        ],
      ),
    );
  }
}
